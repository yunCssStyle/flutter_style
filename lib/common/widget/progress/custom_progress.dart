import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: 2.0,
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff9E00FF)),
    );
  }
}
