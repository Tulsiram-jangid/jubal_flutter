import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/AuthServiceController.dart';
import 'package:my_app/api/ApiModel/LoginRequestModel.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/route/routeName.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/utils/appUtils.dart';
import 'package:my_app/widget/AppButton.dart';
import 'package:my_app/widget/CustomTextField.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  String email = "";
  String password = "";
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

  void onSubmitTap(BuildContext context) async {
    if (email == "") {
      const msg = "Email is required";
      setState(() {
        errorType = FieldTypes.email;
        errorMsg = msg;
      });
      return;
    }
    if (password == "") {
      const msg = "Password is required";
      setState(() {
        errorType = FieldTypes.password;
        errorMsg = msg;
      });
      return;
    }
    setState(() {
      errorType = "";
      errorMsg = "";
      isLoading = true;
    });

    late LoginRequestModel loginRequest;
    final res = await AuthServiceController.loginByEmail(email: email, password: password);
    setState(() {
      isLoading = false;
    });
    loginRequest = LoginRequestModel.fromJson(res);
    if(!loginRequest.status){
      Helper.showToast(context, loginRequest.message);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  label: "Email Address / Username",
                  placeholder: "Enter email Address / username",
                  isPassword: false,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  error: getErrorByType(FieldTypes.email),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  label: "Password",
                  placeholder: "Enter password",
                  isPassword: true,
                  obscureText: showPassword,
                  onChanged: (value) {
                    setState(() {
                      password = value;
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
                  onTap: (){onSubmitTap(context);},
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
                  onTap: () {},
                  backgroundColor: Color(0xFFFFFFFF),
                  textColor: Color(0xFF000000),
                )
              ],
            ),
          ),
        ));
  }
}
