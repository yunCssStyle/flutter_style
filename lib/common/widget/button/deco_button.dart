import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DecoButton extends StatelessWidget {
  final String title;

  const DecoButton({
    super.key,
    required this.title,
  });

  // button deco
  final BoxDecoration _buttonBoxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Color(0xFF6200B0),
        Color(0xFFD001E2),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70.0.w,
      child: DecoratedBox(
        decoration: _buttonBoxDecoration,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pretendard',
              fontSize: 20.0.w,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
