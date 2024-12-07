import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/bottomSheet/bottom_sheet_option.dart';
import 'package:my_app/widget/custome_text_field.dart';
import 'package:my_app/widget/heading_widget.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddAddressScreen();
  }
}

class _AddAddressScreen extends State<AddAddressScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController officeMobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController recoveryEmail = TextEditingController();
  TextEditingController faxNumber = TextEditingController();
  String location = "";
  dynamic locationData;
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  String countryCode = AppConstant.defaultCountryCode;
  Country? mobileCountry = AppConstant.defaultCountry;
  String officeCountryCode = AppConstant.defaultCountryCode;
  Country? officeCountry = AppConstant.defaultCountry;
  String addressType = "";

  String errorMsg = "";
  String errorType = "";

  String getErrorByType(String type) {
    if (errorType == type && errorMsg.isNotEmpty) {
      return errorMsg;
    }
    return "";
  }

  Widget get item_spacer => const SizedBox(
        height: 20,
      );

  bool? onChanged(bool? value) {}

  void onAddressTypeSelect (){
    showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.white,
      context: context, builder: (context){
      return BottomSheetOption();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Add Address"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                placeholder: "Enter first name",
                label: "First Name",
                textEditingController: firstName,
                error: getErrorByType(FieldTypes.firstName),
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter last name",
                label: "Last Name",
                textEditingController: lastName,
                error: getErrorByType(FieldTypes.lastName),
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter mobile number",
                label: "Mobile number",
                textEditingController: mobile,
                error: getErrorByType(FieldTypes.mobile),
                isMobileNumber: true,
                countryCode: countryCode,
                country: mobileCountry,
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter office mobile number",
                label: "Office Mobile number",
                textEditingController: officeMobile,
                error: getErrorByType(FieldTypes.officeMobile),
                isMobileNumber: true,
                countryCode: officeCountryCode,
                country: officeCountry,
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter email address",
                label: "Email",
                textEditingController: email,
                error: getErrorByType(FieldTypes.email),
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter recovery email address",
                label: "Recovery Email",
                textEditingController: recoveryEmail,
                error: getErrorByType(FieldTypes.recoveryEmail),
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter fax number",
                label: "Fax number",
                textEditingController: faxNumber,
                error: getErrorByType(FieldTypes.faxNumber),
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Location",
                label: "Location",
                error: getErrorByType(FieldTypes.location),
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter city",
                label: "City",
                error: getErrorByType(FieldTypes.city),
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter state",
                label: "State",
                error: getErrorByType(FieldTypes.state),
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter country",
                label: "Country",
                error: getErrorByType(FieldTypes.country),
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter zip code",
                label: "Zip Code",
                error: getErrorByType(FieldTypes.zipCode),
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Address type",
                label: "Address type",
                error: getErrorByType(FieldTypes.addressType),
                isDropDown: true,
                onTap: onAddressTypeSelect,
                enabled: false
              ),
              item_spacer,
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: onChanged,
                  ),
                  HeadingWidget(
                    title: "Set as default address",
                    fontSize: 14,
                  )
                ],
              ),
              item_spacer,
              item_spacer,
              AppButton(title: "Save", onTap: (){})
            ],
          ),
        ),
      ),
    );
  }
}
