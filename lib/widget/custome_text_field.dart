import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/google_service_controller.dart';
import 'package:my_app/route/app_navigation.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/screen/search/country_screen.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/utils/appUtils.dart';

typedef OnSearchComplete = void Function(Country c);

class SearchData {
  final String searchQuery;
  final bool isCaseSensitive;
  final OnSearchComplete? onSearchComplete; // Optional callback function

  SearchData({
    required this.searchQuery,
    required this.isCaseSensitive,
    this.onSearchComplete,
  });
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isPassword;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onRightIconTap;
  final String error;
  final TextInputType keyboardType;
  final bool isMobileNumber;
  final String countryCode;
  final Country? country;
  final ValueChanged<Country>? onCountryCodeChanged;
  final String value;
  final TextStyle? textStyle;
  final TextEditingController? textEditingController;
  final bool isDropDown;
  final VoidCallback? onTap;
  final bool enabled;
  final bool isRequired;
  final int? maxLines;
  final int? maxLength;
  final Widget? suffixIcon;
  final bool? isLocation;
  final ValueChanged<AddressDetailModel>? onSelectAddress;
  final bool? activity;

  TextStyle txtStyle = const TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  void onTapField(BuildContext context) {
    if (isLocation != null && isLocation!) {
      AppNavigation.navigateToAddressSearch(
          onSelectAddress: onSelectAddress!, context: context);
    } else if (onTap != null) {
      onTap!();
    }
    return;
  }

  CustomTextField(
      {super.key,
      required this.placeholder,
      this.label = "Label",
      this.isPassword = false,
      this.obscureText = false,
      this.onChanged,
      this.onRightIconTap,
      this.error = "",
      this.keyboardType = TextInputType.text,
      this.isMobileNumber = false,
      this.countryCode = "+1",
      this.value = "",
      this.onCountryCodeChanged,
      this.country,
      this.textStyle,
      this.textEditingController,
      this.isDropDown = false,
      this.onTap,
      this.enabled = true,
      this.isRequired = false,
      this.maxLines = 1,
      this.maxLength,
      this.suffixIcon,
      this.isLocation = false,
      this.onSelectAddress,
      this.activity = false});

  void onCountryTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CountryScreen(
          onSearchComplete: (Country c) {
            onCountryCodeChanged!(c);
          },
        ),
      ),
    );
  }

  Widget get renderSuffixIcon {
    if (activity!) {
      double size = 10;
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center, // To center the CircularProgressIndicator
        child: Transform.scale(scale: .5,child: const CircularProgressIndicator(color: AppColor.primary,),),
      );
    }
    if (isPassword) {
      return (IconButton(
        onPressed: onRightIconTap,
        icon: Icon(
          !obscureText ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey[700],
        ),
      ));
    }
    if (isDropDown) {
      return IconButton(
        onPressed: onRightIconTap,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColor.darkGrey,
        ),
      );
    }
    if (suffixIcon != null) {
      return suffixIcon!;
    }
    return const SizedBox();
  }

  Widget getField() {
    final bool hasError = error != null && error!.trim().isNotEmpty;

    return TextField(
      controller: textEditingController,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: textStyle != null ? textStyle : txtStyle,
      enabled: enabled,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 14,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        suffixIcon: renderSuffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              BorderSide(color: Colors.green.withOpacity(1), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
              color: hasError ? AppColor.primary : Colors.transparent,
              width: 1.5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool hasError = error != null && error!.trim().isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppUtils.spacing),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                if (isRequired)
                  const Text(
                    " *",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (isMobileNumber)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      onCountryTap(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          // if(country != null) CountryPickerUtils.getDefaultFlagImage(country!),
                          if (country != null)
                            Image.asset(
                              CountryPickerUtils.getFlagImageAssetPath(
                                  country!.isoCode),
                              height: 20.0,
                              width: 20.0,
                              fit: BoxFit.contain,
                              package: "country_pickers",
                            ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(countryCode,
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 14)))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(flex: 3, child: getField())
              ],
            )
          else if (isDropDown)
            GestureDetector(
                onTap: () {
                  onTapField(context);
                },
                child: getField())
          else
            getField(),
          if (hasError) ...[
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                error!,
                style: const TextStyle(
                    color: AppColor.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            )
          ]
        ],
      ),
    );
  }
}
