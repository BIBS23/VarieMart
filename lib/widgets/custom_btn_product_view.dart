import 'package:flutter/material.dart';

class CustomProductViewBtn extends StatelessWidget {
  final Color btnColor;
  final Color btnTextColor;
  final String btnText;
  final VoidCallback onClick;

  const CustomProductViewBtn(
      {super.key,
      required this.btnColor,
      required this.btnText,
      required this.btnTextColor, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: btnColor),
          child: Text(btnText,
              style: TextStyle(color: btnTextColor),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
