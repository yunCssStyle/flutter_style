import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/common/models/common_model.dart';
import 'package:mirror_app/common/widget/appbar.dart';
import 'package:mirror_app/common/widget/item_text.dart';
import 'package:mirror_app/common/widget/modal_dialog.dart';
import 'package:mirror_app/common/widget/modal_loading_dialog.dart';
import 'package:mirror_app/pages/camera/model/upload_after_image_model.dart';
import 'package:mirror_app/pages/closet/model/closet_group_list_model.dart';
import 'package:mirror_app/pages/closet/provider/closet_provider.dart';
import 'package:mirror_app/pages/preview/components/preview_detail_component.dart';
import 'package:mirror_app/pages/preview/components/preview_length_component.dart';
import 'package:mirror_app/pages/preview/components/preview_sleeves_component.dart';
import 'package:mirror_app/pages/preview/components/prievew_season_component.dart';
import 'package:mirror_app/pages/preview/model/preview_model.dart';
import 'package:mirror_app/pages/preview/model/user_dress_model.dart';
import 'package:mirror_app/pages/preview/provider/preview_provider.dart';
import 'package:mirror_app/routes/router_config.dart';
import 'package:mirror_app/utils/common_utils.dart';
import 'package:mirror_app/utils/logger.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class PreviewScreen extends ConsumerStatefulWidget {
  final UploadAfterImageModel uploadModel;

  const PreviewScreen({
    super.key,
    required this.uploadModel,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends ConsumerState<PreviewScreen> {
  // 네트워크 체크
  List<ConnectivityResult> _connectionStatus = [];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  late AnimationController localAnimationController;
  bool isShowSnackbar = false;
  // 카테고리 관련
  final List<CommonModel> categoryListF =
      CommonService().getFemaleCategoryList();
  final List<CommonModel> categoryListM = CommonService().getMaleCategoryList();

  // 컬러 관련
  final List<CommonModel> colorList = CommonService().getColorList();

  // 패턴 관련
  final List<CommonModel> patternList = CommonService().getPatternList();

  // 젠더 별 카테고리 리스트 셋팅하는 함수
  List<CommonModel> getGenderCategoryList() {
    final previewState = ref.watch(previewProvider) as PreviewModel;
    if (previewState.gender == 'M') {
      return categoryListM;
    }
    return categoryListF;
  }

  // 받은 Classification 데이터 셋팅
  void setData() async {
    ref.watch(previewProvider) as PreviewModel;
    if (widget.uploadModel.userDressRequestId != null &&
        widget.uploadModel.userDressRequestId != null) {
      ref
          .watch(previewProvider.notifier)
          .setClassification(widget.uploadModel.userDressRequestId!);
    } else {
      context.pop(100);
    }
  }

// 로딩
  Future<void> _loadedBuilder() {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false,
          child: ModalLoadingDialogWidget(
            title: '옷 등록 중',
            content: '입력한 정보를 등록중 입니다.',
          ),
        );
      },
    );
  }

  void registerCloset() async {
    // 유효성 검사
    var previewState = ref.watch(previewProvider) as PreviewModel;
    logger.e(previewState.toString());
    // 네트워크 체크
    if (_connectionStatus.contains(ConnectivityResult.none)) {
      return;
    }
    // 카테고리
    if (previewState.cate1 == 0 ||
        previewState.cate2 == 0 ||
        (CommonService()
                .findChildrenById(previewState.cate2, getGenderCategoryList())
                .isNotEmpty
            ? previewState.cate3 == 0
            : false)) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "카테고리를 선택해주세요.",
        ),
      );
      return;
    }
    // 색상
    if (previewState.color == '') {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "색상을 선택해주세요.",
        ),
      );
      return;
    }
    // 패턴
    if (previewState.pattern == '') {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "패턴을 선택해주세요.",
        ),
      );
      return;
    }
    // 소매기장 체크
    if ((previewState.cate1 == 1 && previewState.cate2 != 11) ||
        previewState.cate1 == 3 ||
        previewState.cate1 == 4) {
      if (previewState.sleeves == '') {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "소매기장을 선택해주세요.",
          ),
        );
        return;
      }
    }
    // 총 장 체크
    if (previewState.lengths == '') {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "총 장 을 선택해주세요.",
        ),
      );
      return;
    }
    // 네크라인 체크
    if (previewState.cate1 == 1 ||
        previewState.cate1 == 3 ||
        previewState.cate1 == 4) {
      if (previewState.detail == '') {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "네크라인을 선택해주세요.",
          ),
        );
        return;
      }
    }
    // 치마일 경우 데이터 변경
    if (previewState.cate2 == 14) {
      if (previewState.cate3 == 98) {
        // H-LINE
        // 306: ["MICRO", "MINI1", "MINI2", "KNEE"],
        // 307: ["MID1", "MID2", "LONG", "MAXI1", "MAXI2"],
        if ((["MICRO", "MINI1", "MINI2", "KNEE"]
            .contains(previewState.lengths))) {
          // mini
          ref.read(previewProvider.notifier).setPreviewState('cate4', '306');
        } else if (["MID1", "MID2", "LONG", "MAXI1", "MAXI2"]
            .contains(previewState.lengths)) {
          // long
          ref.read(previewProvider.notifier).setPreviewState('cate4', '307');
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "치마 총 장을 선택해주세요.",
            ),
          );
          return;
        }
      } else if (previewState.cate3 == 99) {
        // A-LINE
        // 308: ["MICRO", "MINI1", "MINI2", "KNEE"],
        // 309: ["MID1", "MID2", "LONG", "MAXI1", "MAXI2"],
        if (["MICRO", "MINI1", "MINI2", "KNEE"]
            .contains(previewState.lengths)) {
          // mini
          ref.read(previewProvider.notifier).setPreviewState('cate4', '308');
        } else if (["MID1", "MID2", "LONG", "MAXI1", "MAXI2"]
            .contains(previewState.lengths)) {
          // long
          ref.read(previewProvider.notifier).setPreviewState('cate4', '309');
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "치마 총 장을 선택해주세요.",
            ),
          );
          return;
        }
      } else if (previewState.cate3 == 106) {
        // MERMAID
        // 200: ["MID1", "MID2", "LONG", "MAXI1", "MAXI2"],
        if (["MID1", "MID2", "LONG", "MAXI1", "MAXI2"]
            .contains(previewState.lengths)) {
          // long
          ref.read(previewProvider.notifier).setPreviewState('cate4', '200');
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "치마 총 장을 선택해주세요.",
            ),
          );
          return;
        }
      } else if (previewState.cate3 == 103) {
        // PLEATS
        //     314: ["MICRO", "MINI1", "MINI2", "KNEE"],
        // 315: ["MID1", "MID2", "LONG", "MAXI1", "MAXI2"],
        if (["MICRO", "MINI1", "MINI2", "KNEE"]
            .contains(previewState.lengths)) {
          // mini
          ref.read(previewProvider.notifier).setPreviewState('cate4', '314');
        } else if (["MID1", "MID2", "LONG", "MAXI1", "MAXI2"]
            .contains(previewState.lengths)) {
          // long
          ref.read(previewProvider.notifier).setPreviewState('cate4', '315');
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "치마 총 장을 선택해주세요.",
            ),
          );
          return;
        }
      } else if (previewState.cate3 == 105) {
        // TIERED
        // 319: ["MID1", "MID2", "LONG", "MAXI1", "MAXI2"],
        if (["MID1", "MID2", "LONG", "MAXI1", "MAXI2"]
            .contains(previewState.lengths)) {
          // long
          ref.read(previewProvider.notifier).setPreviewState('cate4', '319');
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: "치마 총 장을 선택해주세요.",
            ),
          );
          return;
        }
      }
    }
    previewState = ref.watch(previewProvider) as PreviewModel;
    List<int> categoryIds = [];
    categoryIds.add(previewState.cate1);
    categoryIds.add(previewState.cate2);
    if (previewState.cate3 != 0) {
      categoryIds.add(previewState.cate3);
    }
    if (previewState.cate4 != 0) {
      categoryIds.add(previewState.cate4);
    }
    // 여성 아우터 일때 소매기장 VEST 로 변경
    if (previewState.gender == 'F' &&
        previewState.cate1 == 1 &&
        previewState.cate2 == 11) {
      ref.read(previewProvider.notifier).setPreviewState('sleeves', 'VEST');
    }
    previewState = ref.watch(previewProvider) as PreviewModel;
    UserDressModel userDressModel = UserDressModel(
      gender: previewState.gender,
      adjusted: false,
      categoryId: CommonService().getClosetCategory(categoryIds),
      categoryIds: categoryIds,
      closetCategoryId: CommonService().getClosetCategory(categoryIds),
      colorType: previewState.color,
      lengthType: previewState.lengths,
      mainImageUrl: previewState.mainImageUrl,
      maskImageUrl: previewState.maskImageUrl,
      necklineType: previewState.detail,
      originalImageUrl: previewState.originImageUrl,
      patternType: previewState.pattern,
      seasonTypes: CommonService().removeCommaSeason(previewState.season),
      sleeveType: previewState.sleeves,
      userDressRequestId: previewState.userDressRequestId,
    );
    _loadedBuilder();

    bool userDressResult = await ref
        .watch(previewProvider.notifier)
        .userDressUpload(userDressModel);
    changeView(
        userDressResult,
        CommonService().getClosetCategoryByCategory1AndCategory2(
            previewState.cate1, previewState.cate2, previewState.gender));
  }

  void changeView(bool userDressResult, int closetCategory) {
    //
    final previewState = ref.watch(previewProvider) as PreviewModel;
    final closetState = ref.watch(closetProvider);
    if (closetState is ClosetGroupListModel) {
      var findIndex = closetState.closetGroupList.indexWhere((element) =>
          element.id ==
          CommonService().getClosetCategoryByCategory1AndCategory2(
              previewState.cate1, previewState.cate2, previewState.gender));
      if (findIndex != -1) {
        ref.watch(closetProvider.notifier).closetLoad(findIndex, refresh: true);
      }
    }
    GoRouter.of(context).popUntilPath('/preview');
    _dialogBuilder(context, userDressResult);
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      logger.e('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
    // ignore: avoid_print

    if (_connectionStatus.contains(ConnectivityResult.none)) {
      if (!isShowSnackbar) {
        isShowSnackbar = true;
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "네트워크 연결을 확인해주세요.",
          ),
          persistent: true,
          onAnimationControllerInit: (controller) =>
              localAnimationController = controller,
        );
      }
    } else {
      if (isShowSnackbar) {
        if (localAnimationController.isCompleted) {
          localAnimationController.reverse();
          isShowSnackbar = false;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.watch(previewProvider.notifier).initState();
        setData();
      });

      initConnectivity();
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final previewState = ref.watch(previewProvider) as PreviewModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: '내 옷 정보 입력',
        textButton: '등록하기',
        callback: () {
          registerCloset();
        },
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: widget.uploadModel.mainImageUrl != null
                      ? Image.network(
                          widget.uploadModel.mainImageUrl!,
                          fit: BoxFit.contain,
                          width: 265.w,
                          height: 265.w,
                        )
                      : SizedBox(
                          width: 265.w,
                          height: 265.w,
                        ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: const Color(0xFFEAEAEA),
                      width: 1.0.w,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 18.0.w,
                ),
                child: Column(
                  children: [
                    Text(
                      'AI 분류 정보 확인',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Pretendard',
                        fontSize: 16.0.w,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20.0.w),
                    ItemTextWidget(
                      title: '대분류',
                      defaultItem: CommonService().findCommonNameById(
                          previewState.cate1, getGenderCategoryList()),
                      selectedItem: CommonService()
                          .convertCategoryListToSelectedListTextItem(
                              getGenderCategoryList()),
                      onItemSelected: (selectData) {
                        ref
                            .read(previewProvider.notifier)
                            .onSelectedCategory(0, selectData);
                      },
                      commonList: getGenderCategoryList(),
                    ),
                    ItemTextWidget(
                      title: '중분류',
                      defaultItem: CommonService().findCommonNameById(
                          previewState.cate2,
                          CommonService().findChildrenById(
                              previewState.cate1, getGenderCategoryList())),
                      selectedItem: CommonService()
                          .convertCategoryListToSelectedListTextItem(
                              CommonService().findChildrenById(
                                  previewState.cate1, getGenderCategoryList())),
                      onItemSelected: (selectData) {
                        ref
                            .read(previewProvider.notifier)
                            .onSelectedCategory(1, selectData);
                      },
                      commonList: CommonService().findChildrenById(
                          previewState.cate1, getGenderCategoryList()),
                    ),
                    CommonService()
                            .findChildrenById(
                                previewState.cate2, getGenderCategoryList())
                            .isNotEmpty
                        ? ItemTextWidget(
                            title: '소분류',
                            defaultItem: CommonService().findCommonNameById(
                                previewState.cate3,
                                CommonService().findChildrenById(
                                    previewState.cate2,
                                    getGenderCategoryList())),
                            selectedItem: CommonService()
                                .convertCategoryListToSelectedListTextItem(
                                    CommonService().findChildrenById(
                                        previewState.cate2,
                                        getGenderCategoryList())),
                            onItemSelected: (selectData) {
                              ref
                                  .read(previewProvider.notifier)
                                  .onSelectedCategory(2, selectData);
                            },
                            commonList: CommonService().findChildrenById(
                                previewState.cate2, getGenderCategoryList()),
                          )
                        : const SizedBox(),
                    SizedBox(height: 20.0.w),
                    ItemTextWidget(
                      title: '색상',
                      defaultItem: previewState.color,
                      selectedItem: CommonService().findColorById(colorList),
                      isItemTap: 'Color',
                      onItemSelected: (selectData) {
                        ref.read(previewProvider.notifier).setPreviewState(
                            'color',
                            colorList
                                .firstWhere((d) =>
                                    d.name ==
                                    CommonService().getColorName(selectData))
                                .name);
                      },
                      commonList: colorList,
                    ),
                    ItemTextWidget(
                      title: '패턴',
                      defaultItem: previewState.pattern,
                      selectedItem: CommonService().setNameByName(patternList),
                      isItemTap: 'Pattern',
                      onItemSelected: (selectData) {
                        ref
                            .read(previewProvider.notifier)
                            .setPreviewState('pattern', selectData);
                      },
                      commonList: patternList,
                    ),
                    // 계절
                    const PreviewSeasonComponent(),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: const Color(0xFFEAEAEA),
                      width: 1.0.w,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 18.0.w,
                ),
                child: Column(
                  children: [
                    Text(
                      '개인화 설정',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Pretendard',
                        fontSize: 16.0.w,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20.0.w),
                    const PreviewSleevesComponent(), // 소매
                    const PreviewLengthComponent(), // 총장
                    const PreviewDetailComponent(), // 네크라인
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          registerCloset();
        },
        child: Container(
          width: double.infinity,
          height: 70.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFF6200B0),
                Color(0xFFD001E2),
              ],
            ),
          ),
          child: Center(
            child: Text(
              '등록하기',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Pretendard',
                fontSize: 20.0.w,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, bool result) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: ModalDialogWidget(
            title: result
                ? '옷 등록 완료'
                : _connectionStatus.contains(ConnectivityResult.none)
                    ? '네트워크 연결 실패'
                    : '내 옷 분석 실패',
            content: result
                ? '스마트 미러 옷장에\n내 옷 등록이 완료되었습니다.'
                : _connectionStatus.contains(ConnectivityResult.none)
                    ? '네트워크 연결을 확인해주세요.'
                    : '의상 분석에 실패했습니다.\n다시 촬영해주세요.',
            buttonText1: '확인',
            onPressed1: () {
              if (result) {
                GoRouter.of(context).popUntilPath('/home');
              } else {
                context.pop();
              }
            },
          ),
        );
      },
    );
  }
}
