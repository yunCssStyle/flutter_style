import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewTextWidget extends StatelessWidget {
  final String title;
  final String value;

  const ViewTextWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.0.w, vertical: 4.0.w),
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
                title,
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
            child: Container(
              alignment: Alignment.center,
              height: 36.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFCBCBCB),
                  width: 1.0.w,
                ),
                borderRadius: BorderRadius.circular(5.0.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 16.0.w,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF808080),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
