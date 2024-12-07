import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  final Widget? leftIcon;
  bool isLoading;

  AppButton(
      {Key? key,
      required this.title,
      this.backgroundColor = AppColor.primary,
      this.textColor = Colors.white,
      required this.onTap,
      this.isLoading = false,
      this.leftIcon})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30), // Rounded ripple effect
      splashColor: Colors.white.withOpacity(0.2), // Ripple color
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  leftIcon ?? const SizedBox(),
                  leftIcon != null ? const SizedBox(width: 10,) : const SizedBox(),
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
