import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/auth_service_controller.dart';
import 'package:my_app/api/api_form.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/helper/validator.dart';
import 'package:my_app/route/app_navigation.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/custome_text_field.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePassword();
  }
}

class _ChangePassword extends State<ChangePassword> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String errorType = "";
  String errorMsg = "";
  bool activity = false;

  String getErrorByType(String type) {
    if (errorType == type) {
      return errorMsg;
    }
    return "";
  }

  void onSubmit() async {
    
    if (currentPassword.text.isEmpty) {
      const msg = "Current password is required";
      setState(() {
        errorType = FieldTypes.currentPassword;
        errorMsg = msg;
      });
      return;
    }
    if (newPassword.text.isEmpty) {
      const msg = "New password is required";
      setState(() {
        errorType = FieldTypes.newPassword;
        errorMsg = msg;
      });
      return;
    }
    if (confirmPassword.text.isEmpty) {
      const msg = "Confirm password is required";
      setState(() {
        errorType = FieldTypes.confirmPassword;
        errorMsg = msg;
      });
      return;
    }
    if (!Validator.isValidPassword(newPassword.text)) {
      const msg =
          "New Password must be at least 8 characters long, contain at least one uppercase letter, one number, and one special character.";
      setState(() {
        errorType = FieldTypes.newPassword;
        errorMsg = msg;
      });
      return;
    }
    if (confirmPassword.text != newPassword.text) {
      const msg = "New and confirm password not match";
      setState(() {
        errorType = FieldTypes.confirmPassword;
        errorMsg = msg;
      });
      return;
    }
    setState(() {
      errorType = "";
      errorMsg = "";
    });

    final storeProvider = Provider.of<StoreProvider>(context,listen: false);
    final user = storeProvider.user;

    if(user != null){
      setState(() {
        activity = true;
      });
      dynamic form = ApiForm.getChangePasswordForm(
        currentPassword: currentPassword.text, 
        newPassword: newPassword.text,
        email: user.email ?? "",
        phone: user.phone.toString(),
        countryCode: user.countryCode
      );

      bool res = await AuthServiceController.changePassword(
        body: form,
        context: context
      );
      setState(() {
        activity = false;
      });
      if(res){
        Helper.showToast(context, "Password Changed Successfully");
        AppNavigation.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const AppBarWidget(title: "Password and security"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: _height * .85,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingWidget(
                  title: "Change Password",
                  fontWeight: FontWeight.bold,
                ),
                HeadingWidget(
                  title:
                      "You will be logged out of all the session except this one to protect your account if anyone is trying to gain access.",
                  isText: true,
                  maxLines: 5,
                  color: AppColor.darkGrey,
                  textFontSize: 14,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  textEditingController: currentPassword,
                  placeholder: "Enter Current Password",
                  label: "Current Password",
                  isRequired: true,
                  error: getErrorByType(FieldTypes.currentPassword),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  textEditingController: newPassword,
                  placeholder: "Enter New Password",
                  label: "New Password",
                  isRequired: true,
                  error: getErrorByType(FieldTypes.newPassword),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  textEditingController: confirmPassword,
                  placeholder: "Enter Confirm Password",
                  label: "Confirm Password",
                  isRequired: true,
                  error: getErrorByType(FieldTypes.confirmPassword),
                ),
                Spacer(),
                SafeArea(child: AppButton(title: "Save", onTap: onSubmit, isLoading: activity,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
