import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/utils/appUtils.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isPassword;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onRightIconTap;
  final String error;
  final TextInputType keyboardType;

  CustomTextField({
    super.key,
    required this.placeholder,
    this.label = "Label",
    this.isPassword = false,
    this.obscureText = false,
    this.onChanged,
    this.onRightIconTap,
    this.error = "",
    this.keyboardType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    final bool hasError = error != null && error!.trim().isNotEmpty;

    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppUtils.spacing),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: obscureText,
            onChanged: onChanged,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              suffixIcon: isPassword ? IconButton(
                onPressed: onRightIconTap,
                icon: Icon(
                  !obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey[700],
                ),
              ) : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: hasError ? AppColor.primary : Colors.transparent,
                  width: 1.5
                )
              ),
            ),
          ),
          if(hasError) ...[
            const SizedBox(height: 5,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Text(error!, style: TextStyle(color: AppColor.primary, fontSize: 12,),),)
          ]
        ],
      ),
    );
  }
}
