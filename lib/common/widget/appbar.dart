import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? titleSvg;
  final String? textButton;
  final Function? callback;
  final List<Widget>? actionWidget;
  const AppBarWidget({
    super.key,
    this.title,
    this.titleSvg,
    this.textButton,
    this.callback,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBar(
          surfaceTintColor: Colors.white,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: router.canPop()
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios), // 원하는 아이콘으로 변경
                  onPressed: () {
                    context.pop();
                  },
                )
              : null,
          title: title != null
              ? Text(
                  title!,
                  style: TextStyle(
                    height: 1.2,
                    fontFamily: 'Pretendard',
                    fontSize: 20.0.w,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                )
              : titleSvg != null
                  ? Padding(
                      padding: EdgeInsets.only(top: 20.w),
                      child: SvgPicture.asset(
                        titleSvg!,
                        semanticsLabel: 'StyleMirror',
                      ),
                    )
                  : null,
          actions: <Widget>[
            textButton != null && callback != null
                ? Padding(
                    padding: EdgeInsets.only(right: 10.0.w),
                    child: TextButton(
                      onPressed: callback as void Function()?,
                      child: Text(
                        textButton!,
                        style: TextStyle(
                          color: Colors.black,
                          height: 1.2,
                          fontFamily: 'Pretendard',
                          fontSize: 14.0.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(58.0);
}
