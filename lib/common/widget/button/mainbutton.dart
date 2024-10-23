import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButtonWidget extends StatelessWidget {
  final String title;
  final String text;
  final String image;
  final bool isGradient;
  final bool disabled;
  final Function onPressed;

  const MainButtonWidget({
    super.key,
    required this.title,
    required this.image,
    required this.text,
    this.isGradient = false,
    this.disabled = false,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 19.w),
          child: InkWell(
            onTap: () {
              onPressed();
            },
            child: Ink(
              padding: EdgeInsets.symmetric(vertical: 22.w, horizontal: 24.w),
              width: double.infinity,
              height: 180.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.bottomRight,
                ),
                color: Colors.white,
                gradient: isGradient
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFD001E2),
                          Color(0xFF6200B0),
                        ],
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1.0.w,
                    blurRadius: 5.0.w,
                    offset: Offset(0, 3.w), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isGradient ? Colors.white : Colors.black,
                      height: 1.2,
                      fontFamily: 'Pretendard',
                      fontSize: 28.0.w,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8.w),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.2,
                      fontFamily: 'Pretendard',
                      fontSize: 14.0.w,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (disabled)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
      ],
    );
  }
}
