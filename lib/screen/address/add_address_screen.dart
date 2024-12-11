import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/address_service_controller.dart';
import 'package:my_app/api/ApiController/google_service_controller.dart';
import 'package:my_app/api/api_form.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/helper/validator.dart';
import 'package:my_app/model/staticData/bottom_sheet_option_model.dart';
import 'package:my_app/route/app_navigation.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/bottomSheet/bottom_sheet_option.dart';
import 'package:my_app/widget/custome_text_field.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:provider/provider.dart';

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
  TextEditingController location = TextEditingController();
  AddressDetailModel? locationData;
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  String countryCode = AppConstant.defaultCountryCode;
  Country? mobileCountry = AppConstant.defaultCountry;
  String officeCountryCode = AppConstant.defaultCountryCode;
  Country? officeCountry = AppConstant.defaultCountry;
  TextEditingController addressType = TextEditingController();
  bool isDefault = false;

  TextStyle textStyle = const TextStyle(color: Colors.black);

  ScrollController scrollController = ScrollController();

  String errorMsg = "";
  String errorType = "";
  bool activity = false;

  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    final storeProvider = Provider.of<StoreProvider>(context, listen: false);
    final user = storeProvider.user;
    if (user != null) {
      firstName.text = user.firstName ?? "";
      lastName.text = user.lastName ?? "";
      countryCode = user.countryCode ?? AppConstant.defaultCountryCode;
      mobile.text = user.phone.toString();
      email.text = user.email ?? "";
    }
  }

  String getErrorByType(String type) {
    if (errorType == type && errorMsg.isNotEmpty) {
      return errorMsg;
    }
    return "";
  }

  Widget get item_spacer => const SizedBox(
        height: 20,
      );

  bool? onChanged(bool? value) {
    setState(() {
      isDefault = value ?? false;
    });
  }

  void onSelectAddressType(BottomSheetOptionModel item){
    Navigator.of(context).pop();
    setState(() {
      addressType.text = item.type;
    });
  }

  void onAddressTypeSelect() {
    showModalBottomSheet(
        showDragHandle: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return BottomSheetOption(
            list: BottomSheetOptionModel.getAddressTypeList(),
            onPressed: onSelectAddressType,
          );
        });
  }

  void onAddressSearchTap(){
    AppNavigation.navigateToAddressSearch(context: context, onSelectAddress: (address){
      setState(() {
        location.text = address.address;
        locationData = address;
        city.text = address.city;
        state.text = address.state;
        country.text = address.country;
        zipCode.text = address.postal_code;
      });
    });
  }

  void scrollToOffset(double offset) {
    scrollController.animateTo(offset,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void onSubmit()async {
    if (firstName.text.isEmpty) {
      const msg = "First name is required";
      setState(() {
        errorMsg = msg;
        errorType = FieldTypes.firstName;
      });
      scrollToOffset(0);
      return;
    }
    if (lastName.text.isEmpty) {
      const msg = "Last name is required";
      setState(() {
        errorMsg = msg;
        errorType = FieldTypes.lastName;
      });
      scrollToOffset(0);
      return;
    }
    if (mobile.text.isEmpty) {
      const msg = "Mobile number is required";
      setState(() {
        errorMsg = msg;
        errorType = FieldTypes.mobile;
      });
      scrollToOffset(0);
      return;
    }
    if (officeMobile.text.isEmpty) {
      const msg = "Office Mobile number is required";
      setState(() {
        errorMsg = msg;
        errorType = FieldTypes.officeMobile;
      });
      scrollToOffset(0);
      return;
    }
    if (email.text.isEmpty) {
      const msg = "Email is required";
      setState(() {
        errorMsg = msg;
        errorType = FieldTypes.email;
      });
      scrollToOffset(100);
      return;
    }
    if (!Validator.isValidEmail(email.text)) {
      const msg = "Email is not valid";
      setState(() {
        errorMsg = msg;
        errorType = FieldTypes.email;
      });
      scrollToOffset(100);
      return;
    }
    if (recoveryEmail.text.isEmpty) {
      const msg = "Recovery Email is required";
      setState(() {
        errorMsg = msg;
        errorType = FieldTypes.recoveryEmail;
      });
      scrollToOffset(100);
      return;
    }
    if (!Validator.isValidEmail(recoveryEmail.text)) {
      const msg = "Recovery Email is not valid";
      setState(() {
        errorMsg = msg;
        errorType = FieldTypes.recoveryEmail;
      });
      scrollToOffset(100);
      return;
    }

    setState(() {
      errorMsg = "";
      errorType = "";
    });

    String fullName = "${firstName.text} ${lastName.text}";
    final form = ApiForm.getAddAddressForm(
      name: fullName,
      location: locationData!.toJson(),
      type: addressType.text,
      zipcode: zipCode.text,
      phone: mobile.text,
      countryCode: countryCode,
      office_phone: officeMobile.text,
      office_phone_country_code: officeCountryCode,
      fax: faxNumber.text,
      email: email.text,
      recovery_email: recoveryEmail.text,
      isDefault: isDefault
    );

    setState(() {
      activity = true;
    });

    final res = await AddressServiceController.addNewAddress(body: form);
    setState(() {
      activity = false;
    });
    if(res.status){
      Navigator.of(context).pop();
      Helper.showToast(context, "New Address added successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Add Address"),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                placeholder: "Enter first name",
                label: "First Name",
                textEditingController: firstName,
                error: getErrorByType(FieldTypes.firstName),
                isRequired: true
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter last name",
                label: "Last Name",
                textEditingController: lastName,
                error: getErrorByType(FieldTypes.lastName),
                isRequired: true
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
                isRequired: true
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
                isRequired: true
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter email address",
                label: "Email",
                textEditingController: email,
                error: getErrorByType(FieldTypes.email),
                isRequired: true
              ),
              item_spacer,
              CustomTextField(
                placeholder: "Enter recovery email address",
                label: "Recovery Email",
                textEditingController: recoveryEmail,
                error: getErrorByType(FieldTypes.recoveryEmail),
                isRequired: true
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
                textEditingController: location,
                placeholder: "Location",
                label: "Location",
                error: getErrorByType(FieldTypes.location),
                enabled: false,
                isDropDown: true,
                onTap: onAddressSearchTap,
                textStyle: textStyle,
              ),
              item_spacer,
              CustomTextField(
                textEditingController: city,
                placeholder: "Enter city",
                label: "City",
                error: getErrorByType(FieldTypes.city),
              ),
              item_spacer,
              CustomTextField(
                textEditingController: state,
                placeholder: "Enter state",
                label: "State",
                error: getErrorByType(FieldTypes.state),
              ),
              item_spacer,
              CustomTextField(
                textEditingController: country,
                placeholder: "Enter country",
                label: "Country",
                error: getErrorByType(FieldTypes.country),
              ),
              item_spacer,
              CustomTextField(
                textEditingController: zipCode,
                placeholder: "Enter zip code",
                label: "Zip Code",
                error: getErrorByType(FieldTypes.zipCode),
              ),
              item_spacer,
              CustomTextField(
                textEditingController: addressType,
                  placeholder: "Address type",
                  label: "Address type",
                  error: getErrorByType(FieldTypes.addressType),
                  isDropDown: true,
                  onTap: onAddressTypeSelect,
                  enabled: false,
                  textStyle: textStyle,
                  ),
              item_spacer,
              Row(
                children: [
                  Checkbox(
                    value: isDefault,
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
              AppButton(title: "Save", onTap: onSubmit, isLoading: activity,)
            ],
          ),
        ),
      ),
    );
  }
}
