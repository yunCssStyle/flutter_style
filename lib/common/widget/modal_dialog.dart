import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModalDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText1;
  final Function() onPressed1;
  final String? buttonText2;
  final Function()? onPressed2;
  final String? drawType;
  const ModalDialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.buttonText1,
    required this.onPressed1,
    this.buttonText2,
    this.onPressed2,
    this.drawType = 'column',
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
      actionsPadding: EdgeInsets.all(buttonText2 != null ? 16.w : 0),
      actions: <Widget>[
        drawType == 'column'
            ? Column(
                children: [
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
                      borderRadius:
                          BorderRadius.circular(buttonText2 != null ? 10.0 : 0),
                    ),
                    child: ElevatedButton(
                      onPressed: onPressed1,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.w),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text(
                        buttonText1,
                        style: TextStyle(
                          color: Colors.white,
                          height: 1.2,
                          fontFamily: 'Pretendard',
                          fontSize: 20.0.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  if (buttonText2 != null)
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      onPressed: onPressed2,
                      child: Text(
                        buttonText2!,
                        style: TextStyle(
                          color: Colors.black,
                          height: 1.2,
                          fontFamily: 'Pretendard',
                          fontSize: 20.0.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Container(
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
                        borderRadius: BorderRadius.circular(
                            buttonText2 != null ? 10.0 : 0),
                      ),
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: onPressed1,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(48.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.w),
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          buttonText1,
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.2,
                            fontFamily: 'Pretendard',
                            fontSize: 20.0.w,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (buttonText2 != null)
                    SizedBox(
                      width: 1.w,
                    ),
                  if (buttonText2 != null)
                    Expanded(
                      child: Container(
                        height: 48.h,
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
                          borderRadius: BorderRadius.circular(
                            buttonText2 != null ? 10.0 : 0,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: onPressed2,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(48.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.w),
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          child: Text(
                            buttonText2!,
                            style: TextStyle(
                              color: Colors.white,
                              height: 1.2,
                              fontFamily: 'Pretendard',
                              fontSize: 20.0.w,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
      ],
    );
  }
}
