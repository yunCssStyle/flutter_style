import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mirror_app/common/constants/constants.dart';
import 'package:mirror_app/common/widget/appbar.dart';
import 'package:mirror_app/common/widget/progress/custom_progress.dart';
import 'package:mirror_app/pages/closet/model/closet_menu_model.dart';
import 'package:mirror_app/pages/closet_detail/components/view_text_widget.dart';
import 'package:mirror_app/pages/closet_detail/model/closet_product_item_model.dart';
import 'package:mirror_app/pages/closet_detail/provider/closet_detail_provider.dart';
import 'package:mirror_app/utils/common_utils.dart';
import 'package:mirror_app/utils/logger.dart';

class ClosetDetailScreen extends ConsumerStatefulWidget {
  final int closetId;
  final ClosetMenuModel closet;
  const ClosetDetailScreen(
      {super.key, required this.closetId, required this.closet});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ClosetDetailScreenState();
}

class _ClosetDetailScreenState extends ConsumerState<ClosetDetailScreen> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (widget.closet.id == 0 || widget.closet.categoryId == 0) {
          context.pop();
        }
        if (CommonService().isClosetItem(widget.closet)) {
          // 내옷
          logger.e('내옷');
          ref
              .watch(closetDetailProvider.notifier)
              .getUserCloset(widget.closet.userDressId ?? 0);
        } else {
          // 상품
          logger.e('상품');
          ref
              .watch(closetDetailProvider.notifier)
              .getProductItem(widget.closet.productId ?? 0);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final previewState =
        ref.watch(closetDetailProvider) as ClosetProductModelBase;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(
        title: '아이템 상세정보',
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.closet.mainImageUrl,
                    width: 265.w,
                    height: 265.w,
                    fit: BoxFit.contain,
                    progressIndicatorBuilder: (context, url, progress) =>
                        const Center(
                      child: CustomProgress(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
                child: (previewState is ClosetProductModel)
                    ? Column(
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
                          ViewTextWidget(
                            title: '카테고리',
                            value: previewState.closetModel?.categoryName ??
                                previewState.productModel?.categoryName ??
                                '',
                          ),
                          ViewTextWidget(
                            title: '패턴',
                            value: previewState.closetModel?.patternType ??
                                previewState.productModel?.patternType ??
                                '',
                          ),
                          ViewTextWidget(
                            title: '컬러',
                            value: previewState.closetModel?.colorType ??
                                previewState.productModel?.colorType ??
                                '',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 27.0.w, vertical: 4.0.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    padding: EdgeInsets.only(right: 15.0.w),
                                    child: Text(
                                      textAlign: TextAlign.right,
                                      '계절',
                                      style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 16.0.w,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  fit: FlexFit.tight,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: seasonList
                                          .map((season) => Row(
                                                children: [
                                                  Transform.scale(
                                                    scale: 1.2,
                                                    child: Checkbox(
                                                      /// 체크박스 선택 값
                                                      value: (previewState
                                                                  .closetModel
                                                                  ?.seasonTypes ??
                                                              previewState
                                                                  .productModel
                                                                  ?.seasonTypes ??
                                                              '')
                                                          .contains(season),

                                                      /// 체크박스를 누르고 있을 때 발생하는 splash 이벤트의 컬러
                                                      overlayColor:
                                                          const WidgetStatePropertyAll(
                                                              Color.fromRGBO(98,
                                                                  0, 176, 0.2)),

                                                      /// splash의 크기
                                                      splashRadius: 24,

                                                      /// MaterialTapTargetSize.padded : 최소사이즈 48x48 로 세팅
                                                      /// MaterialTapTargetSize.shrinkWrap : Material에 의해 제공된 최소 사이즈
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,

                                                      /// 선택 안 됐을 때 테두리 컬러와
                                                      /// 선택 됐을 때 배경 컬러 설정
                                                      fillColor: WidgetStatePropertyAll((previewState
                                                                      .closetModel
                                                                      ?.seasonTypes ??
                                                                  previewState
                                                                      .productModel
                                                                      ?.seasonTypes ??
                                                                  '')
                                                              .contains(season)
                                                          ? const Color(
                                                              0xFF6200B0)
                                                          : const Color(
                                                              0xFFCBCBCB)),

                                                      /// 체크박스의 모양 변경
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      side:
                                                          WidgetStateBorderSide
                                                              .resolveWith(
                                                        (states) =>
                                                            const BorderSide(
                                                                width: 1.0,
                                                                color: Color(
                                                                    0xFFCBCBCB)),
                                                      ),

                                                      /// 체크박스를 클릭했을 때 호출
                                                      onChanged: (value) {},
                                                    ),
                                                  ),
                                                  Text(
                                                    CommonService()
                                                        .printSeason(season),
                                                    style: TextStyle(
                                                        color: (previewState
                                                                        .closetModel
                                                                        ?.seasonTypes ??
                                                                    previewState
                                                                        .productModel
                                                                        ?.seasonTypes ??
                                                                    '')
                                                                .contains(
                                                                    season)
                                                            ? const Color(
                                                                0xFF808080)
                                                            : const Color(
                                                                0xFFCBCBCB)),
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
