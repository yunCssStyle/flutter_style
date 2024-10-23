import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SnackBarType {
  success,
  info,
  error,
}

class CustomSnackBarWidget extends StatefulWidget {
  const CustomSnackBarWidget.success({
    super.key,
    required this.message,
    this.type = SnackBarType.success,
  });

  const CustomSnackBarWidget.info({
    super.key,
    required this.message,
    this.type = SnackBarType.info,
  });

  const CustomSnackBarWidget.error({
    super.key,
    required this.message,
    this.type = SnackBarType.error,
  });

  final String message;
  final SnackBarType type;

  @override
  CustomSnackBarWidgetState createState() => CustomSnackBarWidgetState();
}

class CustomSnackBarWidgetState extends State<CustomSnackBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 6.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0, 10),
                )
              ],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                SvgPicture.asset(widget.type == SnackBarType.error
                    ? 'assets/images/common/ep-error.svg'
                    : 'assets/images/common/ep-success.svg'),
                const SizedBox(width: 10.0),
                Text(
                  widget.message,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    height: 1.2,
                    fontFamily: 'Pretendard',
                    fontSize: 14.0.w,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
