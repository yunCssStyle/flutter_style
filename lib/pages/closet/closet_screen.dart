import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/common/constants/constants.dart';
import 'package:mirror_app/common/widget/button/deco_button.dart';
import 'package:mirror_app/common/widget/items/closet_item.dart';
import 'package:mirror_app/common/widget/modal_dialog.dart';
import 'package:mirror_app/common/widget/progress/custom_progress.dart';
import 'package:mirror_app/common/widget/snack_bar.dart';
import 'package:mirror_app/pages/closet/model/closet_group_list_model.dart';
import 'package:mirror_app/pages/closet/model/closet_menu_model.dart';
import 'package:mirror_app/pages/closet/provider/closet_provider.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../common/widget/appbar.dart';

class ClosetScreen extends ConsumerStatefulWidget {
  const ClosetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClosetScreenState();
}

class _ClosetScreenState extends ConsumerState<ClosetScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool isEditMode = false;
  List<int> deleteIdList = [];

  @override
  void initState() {
    super.initState();
    _initializeTabController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(closetProvider.notifier).closetLoad(_tabController.index);
    });
  }

  void resetEditMode() {
    setState(() {
      deleteIdList.clear();
      isEditMode = false;
    });
  }

  void handleRemoveEvent() {
    if (deleteIdList.isNotEmpty) {
      ref
          .watch(closetProvider.notifier)
          .deleteUserCloset(_tabController.index, deleteIdList);
      resetEditMode();
    }
  }

  void selectItem(
    int id,
    ClosetMenuModel? closet,
  ) {
    if (isEditMode) {
      setState(() {
        if (deleteIdList.contains(id)) {
          deleteIdList.remove(id);
        } else {
          deleteIdList.add(id);
        }
      });
    } else {
      if (closet != null && closet.verified) {
        context.push('/closet/detail/$id', extra: closet);
      }
    }
  }

  void _initializeTabController() {
    final closet = ref.read(closetProvider) as ClosetGroupListModel;
    _tabController = TabController(
      length: closet.closetGroupList.length,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        ref.watch(closetProvider.notifier).closetLoad(_tabController.index);
        resetEditMode();
      } else if (_tabController.index != _tabController.previousIndex) {
        ref.watch(closetProvider.notifier).closetLoad(_tabController.index);
        resetEditMode();
      }
    });
  }

  photoAction() async {
    await availableCameras().then((value) {
      context.push('/camera', extra: value).then((onValue) async {
        if (onValue != null) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBarWidget.success(
              message: "사진 촬영 완료",
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(() {});
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final closetState = ref.watch(closetProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: '내 옷 정보',
        textButton: isEditMode ? '취소' : '편집',
        callback: () {
          setState(() {
            isEditMode = !isEditMode;
            deleteIdList.clear();
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          photoAction();
        },
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: 75.w,
          height: 75.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                75.w,
              ),
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF6200B0),
                  Color(0xFFD001E2),
                ],
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  '내 옷\n등록하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      body: (closetState is ClosetGroupListModel)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabBar(
                  tabs: closetState.closetGroupList
                      .map((closetMenu) => Container(
                            height: 38.h,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(
                                closetMenu
                                    .name, // Assuming closetMenu has a title property
                              ),
                            ),
                          ))
                      .toList(),
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5.sp,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: const Color(0xffCBCBCB),
                  isScrollable: true,
                  controller: _tabController,
                  indicatorWeight: 0,
                  dividerColor: Colors.transparent,
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide.none, // 하단 선 제거
                    ),
                  ),
                  tabAlignment: TabAlignment.start,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      TabBarView(
                        controller: _tabController,
                        children: closetState.closetGroupList
                            .map((closetMenu) => Padding(
                                  padding:
                                      EdgeInsets.only(left: 12.w, right: 12.w),
                                  child: closetMenu.closetList.isEmpty
                                      ? Center(
                                          child: Text(
                                            '등록된 옷이 없습니다.',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(0xff131314),
                                            ),
                                          ),
                                        )
                                      : AnimationLimiter(
                                          child: GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  3, // 한 행에 표시할 항목 수
                                              crossAxisSpacing:
                                                  0, // 항목 간의 가로 간격
                                              mainAxisSpacing:
                                                  5.h, // 항목 간의 세로 간격
                                              childAspectRatio: 1 /
                                                  closetRatio, // 항목의 가로 세로 비율
                                            ),
                                            itemCount: closetMenu.closetList
                                                .length, // 그리드 항목의 총 개수
                                            itemBuilder: (context, index) {
                                              return AnimationConfiguration
                                                  .staggeredGrid(
                                                columnCount: 3,
                                                position: index,
                                                duration: const Duration(
                                                    milliseconds: 1000),
                                                child: ScaleAnimation(
                                                  scale: 0.5,
                                                  child: FadeInAnimation(
                                                    child: closetMenu.closetList
                                                            .isNotEmpty
                                                        ? GestureDetector(
                                                            onTap: () {
                                                              selectItem(
                                                                  closetMenu
                                                                      .closetList[
                                                                          index]
                                                                      .id,
                                                                  closetMenu
                                                                          .closetList[
                                                                      index]);
                                                            },
                                                            child: ClosetItem(
                                                              closet: closetMenu
                                                                      .closetList[
                                                                  index],
                                                              isEditMode:
                                                                  isEditMode,
                                                              isCheck: deleteIdList
                                                                  .contains(closetMenu
                                                                      .closetList[
                                                                          index]
                                                                      .id),
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                ))
                            .toList(),
                      ),
                      if (isEditMode)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              _removeClosetBuilder(context);
                            },
                            child: const DecoButton(
                              title: '삭제',
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            )
          : (closetState is ClosetGroupListLoading)
              ? const Center(
                  child: CustomProgress(),
                )
              : Center(
                  child: Text(
                    '에러가 발생했습니다.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xff131314),
                    ),
                  ),
                ),
    );
  }

  Future<void> _removeClosetBuilder(BuildContext context) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ModalDialogWidget(
          title: '내 옷 삭제',
          content: '선택하신 옷을\n삭제 하시겠습니까?',
          buttonText1: '취소',
          onPressed1: () {
            context.pop();
          },
          buttonText2: '확인',
          onPressed2: () {
            handleRemoveEvent();
            context.pop();
          },
          drawType: 'row',
        );
      },
    );
  }
}
