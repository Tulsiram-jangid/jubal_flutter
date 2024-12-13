import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  final Widget? leftIcon;
  final double? width; 
  final double? height; 
  final Color borderColor;
  final bool? disabled;
  bool isLoading;

  AppButton(
      {Key? key,
      required this.title,
      this.backgroundColor = AppColor.primary,
      this.textColor = Colors.white,
      required this.onTap,
      this.isLoading = false,
      this.leftIcon,
      this.width = double.infinity,
      this.height = 50,
      this.borderColor = Colors.transparent,
      this.disabled = false
      })
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {

    bool _disabled = disabled ?? false;

    return InkWell(
      onTap: _disabled ? (){} : onTap,
      borderRadius: BorderRadius.circular(30), // Rounded ripple effect
      splashColor: Colors.white.withOpacity(0.2), // Ripple color
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: _disabled ? Colors.black12 : backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border:  Border.all(
            color: borderColor,
            width: 1
          )
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
