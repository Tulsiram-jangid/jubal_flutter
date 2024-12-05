import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/auth_service_controller.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/model/logged_in_user.dart';
import 'package:my_app/model/user_model.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/screen/auth/remember_user.dart';
import 'package:my_app/screen/auth/upload_image.dart';
import 'package:my_app/store/StoreProvider.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/utils/appUtils.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/custome_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  bool showPassword = false;
  bool isLoading = false;

  String errorType = "";
  String errorMsg = "";

  BuildContext? _context;

  @override
  void initState() {
    super.initState();
    _context = context;
    Future.delayed(const Duration(seconds: 1), () {
      showRememberUserList(context);
    });
  }

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

  void onSelectUser(LoggedInUser user) async {
    if (user.type == "email") {
      Navigator.of(context).pop();
      emailController.text = user.email ?? "";
      passwordController.text = user.password ?? "";
      callLoginService(user.email ?? "", user.password ?? "", context);
    }
  }

  void showRememberUserList(BuildContext context) async {
    // Retrieve the list of users
    List<LoggedInUser> users = await LoggedInUser.getLoggedInUserList();

    if (users.isEmpty) {
      return;
    }
    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          content: RememberUser(
            onTap: (LoggedInUser user) {
              onSelectUser(user);
            },
          ),
          contentTextStyle: const TextStyle(),
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
        );
      },
    );
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
    callLoginService(emailController.text, passwordController.text, context);
  }

  void callLoginService(
      String email, String password, BuildContext context) async {
    setState(() {
      errorType = "";
      errorMsg = "";
      isLoading = true;
    });
    final res = await AuthServiceController.loginByEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
    if (res.status) {
      LoggedInUser.setLoggedInUser(
          id: res.data['id'],
          email: emailController.text,
          password: passwordController.text,
          mobile: "",
          type: "email");
    }
    setState(() {
      isLoading = false;
    });
  }

  void _showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
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
