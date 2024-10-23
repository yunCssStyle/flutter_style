import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirror_app/common/widget/progress/custom_progress.dart';

class ModalLoadingDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  const ModalLoadingDialogWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      titlePadding: EdgeInsets.zero,
      title: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15.0.w),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE8E8E8),
              width: 1.0,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            height: 1.2,
            fontFamily: 'Pretendard',
            fontSize: 20.0.w,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Text(
          textAlign: TextAlign.center,
          content,
          style: TextStyle(
            color: const Color(0xFF353535),
            height: 1.2,
            fontFamily: 'Pretendard',
            fontSize: 18.0.w,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.all(0),
      actions: <Widget>[
        Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF6200B0),
                  Color(0xFFD001E2),
                ],
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomProgress(),
              ),
            )),
      ],
    );
  }
}
