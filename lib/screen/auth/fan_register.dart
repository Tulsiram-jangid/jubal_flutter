import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/api/ApiController/auth_service_controller.dart';
import 'package:my_app/api/api_form.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/model/post/post_model.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/utils/appUtils.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/back_button_widget.dart';
import 'package:my_app/widget/custome_text_field.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';

class FanRegisterScreen extends StatefulWidget {
  const FanRegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FanRegisterScreen();
  }
}

class _FanRegisterScreen extends State<FanRegisterScreen> {
  final ScrollController _scrollController = ScrollController();

  final double spacing = 16.0;
  String errorType = "";
  String errorMsg = "";

  String firstName = "";
  String lastName = "";
  String userName = "";
  String email = "";
  String mobile = "";
  String countryCode = "+1";
  Country? country = CountryPickerUtils.getCountryByPhoneCode("1");
  String password = "";
  String confirmPassword = "";
  bool showPassword = !false;
  bool showConfirmPassword = !false;
  bool activity = false;

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {}

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String getErrorMsgByType(String type) {
    if (errorType == type) return errorMsg;
    return "";
  }

  void updateErrorMsg(String msg, String type) {
    setState(() {
      errorType = type;
      errorMsg = msg;
    });
    _scrollController.animateTo(0,
        duration: const Duration(microseconds: 1000),
        curve: Curves.easeInCubic);
  }

  Future<bool> validateMobileEmailUsername(
      {String? email,
      String? mobile,
      String? countryCode,
      String? username}) async {
    bool status = await AuthServiceController.validateMobileEmailAndUsername(
        email: email,
        context: context,
        username: username,
        mobile: mobile,
        countryCode: countryCode);
    return status;
  }

  void onSubmit() async {
    if (firstName == "") {
      String msg = "First name is required";
      updateErrorMsg(msg, FieldTypes.firstName);
      return null;
    } else if (lastName == "") {
      String msg = "Last name is required";
      updateErrorMsg(msg, FieldTypes.lastName);
      return null;
    } else if (userName == "") {
      String msg = "Username is required";
      updateErrorMsg(msg, FieldTypes.userName);
      return null;
    } else if (mobile == "") {
      String msg = "Mobile number is required";
      updateErrorMsg(msg, FieldTypes.mobile);
      return null;
    } else if (email == "") {
      String msg = "Email is required";
      updateErrorMsg(msg, FieldTypes.email);
      return null;
    } else if (password == "") {
      String msg = "Password is required";
      updateErrorMsg(msg, FieldTypes.password);
      return null;
    } else if (confirmPassword == "") {
      String msg = "Confirm Password is required";
      updateErrorMsg(msg, FieldTypes.confirmPassword);
      return null;
    } else if (confirmPassword != password) {
      String msg = "Confirm Password and password not match";
      updateErrorMsg(msg, FieldTypes.confirmPassword);
      return null;
    }
    setState(() {
      errorMsg = "";
      errorType = "";
      activity = true;
    });

    bool validationStatus = await validateMobileEmailUsername(
        email: email,
        username: userName,
        mobile: mobile,
        countryCode: countryCode);

    if (validationStatus) {
      //call register api

      final body = ApiForm.getRegisterForm(
        email: email,
        password: password,
        phone: mobile,
        countryCode: countryCode,
        firstName: firstName,
        lastName: lastName,
        username: userName
      );

      final res = await AuthServiceController.registerUser(
        body: body
      );

      if(res.status){
        Navigator.of(context).pop();
        Helper.showToast(context, "You are registered successfully please login to continue");
      }else {
        Helper.showAlert(context, "Service Error", res.message);
      }
    }
    setState(() {
      activity = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Sign up to continue with us"),
          leading: BackButtonWidget()),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(AppUtils.spacing),
        child: Column(
          children: [
            CustomTextField(
              placeholder: "Enter first name",
              label: "First name",
              onChanged: (value) => setState(() {
                firstName = value;
              }),
              error: getErrorMsgByType(FieldTypes.firstName),
            ),
            SizedBox(
              height: spacing,
            ),
            CustomTextField(
              placeholder: "Enter last name",
              label: "Last name",
              onChanged: (value) => setState(() {
                lastName = value;
              }),
              error: getErrorMsgByType(FieldTypes.lastName),
            ),
            SizedBox(
              height: spacing,
            ),
            CustomTextField(
              placeholder: "Enter username",
              label: "Username",
              onChanged: (value) => setState(() {
                userName = value;
              }),
              error: getErrorMsgByType(FieldTypes.userName),
            ),
            SizedBox(
              height: spacing,
            ),
            CustomTextField(
              placeholder: "Enter mobile number",
              label: "Mobile Number",
              onChanged: (value) => setState(() {
                mobile = value;
              }),
              error: getErrorMsgByType(FieldTypes.mobile),
              keyboardType: TextInputType.phone,
              isMobileNumber: true,
              country: country,
              countryCode: countryCode,
              onCountryCodeChanged: (country) {
                setState(() {
                  countryCode = country.phoneCode;
                  country = country;
                });
              },
            ),
            SizedBox(
              height: spacing,
            ),
            CustomTextField(
              placeholder: "Enter email address",
              label: "Email",
              onChanged: (value) => setState(() {
                email = value;
              }),
              error: getErrorMsgByType(FieldTypes.email),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: spacing,
            ),
            CustomTextField(
              placeholder: "Enter password",
              label: "Password",
              onChanged: (value) => setState(() {
                password = value;
              }),
              error: getErrorMsgByType(FieldTypes.password),
              isPassword: true,
              obscureText: showPassword,
              onRightIconTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
            ),
            SizedBox(
              height: spacing,
            ),
            CustomTextField(
              placeholder: "Enter confirm password",
              label: "Confirm Password",
              onChanged: (value) => setState(() {
                confirmPassword = value;
              }),
              error: getErrorMsgByType(FieldTypes.confirmPassword),
              isPassword: true,
              obscureText: showConfirmPassword,
              onRightIconTap: () {
                setState(() {
                  showConfirmPassword = !showConfirmPassword;
                });
              },
            ),
            const SizedBox(
              height: 100,
            ),
            SafeArea(
                child: AppButton(
              title: "Continue",
              onTap: onSubmit,
              isLoading: activity,
            ))
          ],
        ),
      ),
    );
  }
}
