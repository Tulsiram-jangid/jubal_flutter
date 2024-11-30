import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/auth_service_controller.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/model/user_model.dart';
import 'package:my_app/route/routeName.dart';
import 'package:my_app/screen/auth/upload_image.dart';
import 'package:my_app/store/StoreProvider.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/utils/appUtils.dart';
import 'package:my_app/widget/AppButton.dart';
import 'package:my_app/widget/CustomTextField.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController(text: "rohan@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "");
  bool showPassword = false;
  bool isLoading = false;

  String errorType = "";
  String errorMsg = "";

  void onFanRegisterTap(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.fanRegisterScreen);
  }

  String getErrorByType(String type) {
    if (type == errorType) {
      return errorMsg;
    }
    return "";
  }

  void navigateToOtp(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.otpVerifyScreen);
  }

  void onSubmitTap(BuildContext context) async {
    if (emailController.text == "") {
      const msg = "Email is required";
      setState(() {
        errorType = FieldTypes.email;
        errorMsg = msg;
      });
      return;
    }
    if (passwordController.text == "") {
      const msg = "Password is required";
      setState(() {
        errorType = FieldTypes.password;
        errorMsg = msg;
      });
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() {
      errorType = "";
      errorMsg = "";
      isLoading = true;
    });
    
    final res = await AuthServiceController.loginByEmail(
        email: emailController.text, password: passwordController.text, context: context);
    setState(() {
      isLoading = false;
    });
  }

  void _showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Text(
              'This is a custom alert dialog with an icon and a different shape.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle confirmation action
                Navigator.of(context).pop();
              },
              child: Text('Confirm'),
            ),
          ],
          icon: Icon(Icons.warning),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //return UploadImage();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign in to continue with us",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        backgroundColor: AppColor.bgColor,
        body: Padding(
          padding: EdgeInsets.all(AppUtils.spacing),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  textEditingController: emailController,
                  label: "Email Address / Username",
                  placeholder: "Enter email Address / username",
                  isPassword: false,
                  onChanged: (value) {
                    setState(() {
                      emailController.text = value;
                    });
                  },
                  error: getErrorByType(FieldTypes.email),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  textEditingController: passwordController,
                  label: "Password",
                  placeholder: "Enter password",
                  isPassword: true,
                  obscureText: showPassword,
                  onChanged: (value) {
                    setState(() {
                      passwordController.text = value;
                    });
                  },
                  onRightIconTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  error: getErrorByType(FieldTypes.password),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [Spacer(), const Text("Forget Password?")],
                ),
                const SizedBox(
                  height: 50,
                ),
                AppButton(
                  title: "Sign in",
                  onTap: () {
                    onSubmitTap(context);
                  },
                  isLoading: isLoading,
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                  title: "Sign up as talent or vendor",
                  onTap: () {},
                  backgroundColor: Color(0xFF7A1ADA),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                  title: "Sign up as fan",
                  onTap: () {
                    onFanRegisterTap(context);
                  },
                  backgroundColor: Color(0xFF18C2E7),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                  title: "Sign up with mobile number",
                  onTap: () {
                    _showCustomAlertDialog(context);
                  },
                  backgroundColor: Color(0xFFFFFFFF),
                  textColor: Color(0xFF000000),
                )
              ],
            ),
          ),
        ));
  }
}
