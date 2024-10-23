import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirror_app/common/constants/constants.dart';
import 'package:mirror_app/common/widget/progress/custom_progress.dart';
import 'package:mirror_app/pages/closet/model/closet_menu_model.dart';

class ClosetItem extends StatelessWidget {
  final ClosetMenuModel closet;
  final bool isEditMode;
  final bool isCheck;

  const ClosetItem({
    super.key,
    required this.closet,
    required this.isEditMode,
    required this.isCheck,
  });
  @override
  Widget build(BuildContext context) {
    final topPadding = 19.h;
    final screenWidth =
        MediaQuery.of(context).size.width / 3 - 24.w - topPadding;
    final isFinishVtonItem = !closet.verified;
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: topPadding, left: 17.w, right: 17.w),
              child: isFinishVtonItem
                  ? ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                      child: CachedNetworkImage(
                        imageUrl: closet.mainImageUrl,
                        width: screenWidth,
                        height: screenWidth * closetRatio,
                        fit: BoxFit.contain,
                        progressIndicatorBuilder: (context, url, progress) =>
                            const Center(
                          child: CustomProgress(),
                        ),
                        // memCacheHeight: (screenWidth * closetRatio).floor(),
                        // memCacheWidth: screenWidth.floor(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: closet.mainImageUrl,
                      width: screenWidth,
                      height: screenWidth * closetRatio,
                      fit: BoxFit.contain,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const Center(
                        child: CustomProgress(),
                      ),
                      // memCacheHeight: (screenWidth * closetRatio).floor(),
                      // memCacheWidth: screenWidth.floor(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
            ),
            Text(
              closet.categoryName ?? '',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.5,
                letterSpacing: -0.5.sp,
                color: const Color(0xff808080),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        // vton
        if (isFinishVtonItem)
          Positioned(
            left: 0,
            right: 0,
            height: screenWidth * closetRatio + topPadding,
            child: Center(
              child: SizedBox(
                width: screenWidth - 22.w,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xffEEEEF4),
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 6.h,
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                          color: const Color(0xff131314),
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              '스타일 핏\n생성 중 …',
                              textAlign: TextAlign.center,
                            ),
                          ],
                          pause: const Duration(milliseconds: 3000),
                          repeatForever: true,
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.h, bottom: 6.h),
                        child: const CustomProgress(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        // 삭제 모드일 때 체크박스 표시
        Positioned(
          top: 6.h,
          right: 6.w,
          child: Visibility(
            visible: isEditMode,
            child: Container(
              width: 16.w,
              height: 16.h,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff808080),
                  width: 1.w,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(isCheck
                    ? 'assets/images/common/check.svg'
                    : 'assets/images/common/non-check.svg'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
