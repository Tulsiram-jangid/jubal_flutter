import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/auth_service_controller.dart';
import 'package:my_app/api/ApiController/file_service_controller.dart';
import 'package:my_app/api/ApiController/google_service_controller.dart';
import 'package:my_app/api/api_form.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/helper/picker.dart';
import 'package:my_app/helper/validator.dart';
import 'package:my_app/model/user_model.dart';
import 'package:my_app/route/app_navigation.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/app_image.dart';
import 'package:my_app/widget/custome_text_field.dart';
import 'package:my_app/widget/user_circle_image.dart';
import 'package:provider/provider.dart';

class ProfileDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileDetail();
  }
}

class _ProfileDetail extends State<ProfileDetail> {
  //These are form states
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController countryCode =
      TextEditingController(text: AppConstant.defaultCountryCode);
  TextEditingController email = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController location = TextEditingController();
  AddressDetailModel? locationData;

  File? bannerFile;
  File? imageFile;
  String? bannerUrl;
  String? imageUrl;

  //THis is for initial values for form
  Map<String, dynamic> initialValues = {};

  //This is for validation like username, mobile and email
  String? activityFieldType;
  bool activityValidationStatus = false;
  bool validationActivity = false;
  String? errorMessage = ""; 

  bool activity = false;

  void initState() {
    super.initState();
    getUser();
  }

  void getUser() {
    final storeProvider = Provider.of<StoreProvider>(context, listen: false);
    final user = storeProvider.user;
    if (user != null) {
      Map<String, dynamic> locationData = jsonDecode(user.location ?? "");

      firstName.text = user.firstName ?? "";
      lastName.text = user.lastName ?? "";
      userName.text = user.username ?? "";
      mobile.text = user.phone.toString();
      countryCode.text = user.countryCode ?? AppConstant.defaultCountryCode;
      email.text = user.email ?? "";
      location.text = locationData['address'] ?? "";
      about.text = user.about ?? "";
      bannerUrl = user.profileBanner;
      imageUrl = user.profilePhoto;

      //set initial values
      initialValues = {
        "firstName": user.firstName ?? "",
        "lastName": user.lastName ?? "",
        "userName": user.username ?? "",
        "mobile": user.phone.toString(),
        "countryCode": user.countryCode ?? "",
        "email": user.email ?? "",
        "location": locationData['address'] ?? "",
        "about": user.about ?? "",
      };
    }
  }

  bool isFieldUpdated() {
    return firstName.text != initialValues['firstName'] ||
        lastName.text != initialValues['lastName'] ||
        userName.text != initialValues['userName'] ||
        mobile.text != initialValues['mobile'] ||
        countryCode.text != initialValues['countryCode'] ||
        email.text != initialValues['email'] ||
        location.text != initialValues['location'] ||
        about.text != initialValues['about'];
  }

  Widget get item_spacer {
    return const SizedBox(
      height: 20,
    );
  }

  void validateUserName(String value) async {
    if (initialValues['userName'] != value && value.length > 2) {
      setState(() {
        validationActivity = true;
        activityFieldType = FieldTypes.userName;
        errorMessage = "";
      });
      String msg = "";
      final res = await AuthServiceController.validateMobileEmailAndUsername(
          context: context, username: Helper.getUserNameFormate(value));

      if(!res){
        msg = "This username has already been used, try other one";
      }
      setState(() {
        validationActivity = false;
        errorMessage = msg;
      });
    }
  }

  void validateMobile(String value) async {
    if (initialValues['mobile'] != value && value.length == 10) {
      setState(() {
        validationActivity = true;
        activityFieldType = FieldTypes.mobile;
        errorMessage = "";
      });
      String msg = "";
      final res = await AuthServiceController.validateMobileEmailAndUsername(
          context: context, mobile: value, countryCode: countryCode.text);

      if(!res){
        msg = "This mobile has already been used, try other one";
      }
      setState(() {
        validationActivity = false;
        errorMessage = msg;
        activityFieldType = res ? "" : FieldTypes.mobile;
      });
    }
  }


  void validateEmail(String value) async {
    if (initialValues['email'] != value && Validator.isValidEmail(value)) {
      setState(() {
        validationActivity = true;
        activityFieldType = FieldTypes.email;
        errorMessage = "";
      });
      String msg = "";
      final res = await AuthServiceController.validateMobileEmailAndUsername(
          context: context, email: value);

      if(!res){
        msg = "This email has already been used, try other one";
      }
      setState(() {
        validationActivity = false;
        errorMessage = msg;
        activityFieldType = res ? "" : FieldTypes.email;
      });
    }
  }

  bool getFieldActivityByType(String type) {
    if (type == activityFieldType) {
      return validationActivity;
    }
    return false;
  }

  String getErrorMessageByType(String type) {
    if (type == activityFieldType) {
      return errorMessage ?? "";
    }
    return "";
  }

  void onSubmit() async {
    final storeProvider = Provider.of<StoreProvider>(context, listen: false);
    final List<Future> uploadTask = [];
    setState(() {
      activity = true;
    });

    if (imageFile != null) {
      uploadTask.add(FileServiceController.uploadFile(
        file: imageFile!,
        userId: AppConstant.userId ?? "",
        type: "profilePhoto",
        key: "profilePhoto",
      ));
    }

    if (bannerFile != null) {
      uploadTask.add(FileServiceController.uploadFile(
        file: bannerFile!,
        userId: AppConstant.userId ?? "",
        type: "profileBanner",
        key: "profileBanner",
      ));
    }

    dynamic form = ApiForm.getUserProfileForm(
      firstName: firstName.text,
      lastName: lastName.text,
      phone: initialValues['mobile'] != mobile.text ? mobile.text : null,
      countryCode: countryCode.text,
      email: initialValues['email'] != email.text ? email.text : null,
      location: initialValues['location'] != location.text ? jsonEncode(locationData!.toJson()) : null,
      about: about.text
    );

    uploadTask.add(AuthServiceController.updateUserProfile(
      body: form,
      context: context
    ));

    if (uploadTask.isNotEmpty) {
      uploadTask.add(AuthServiceController.getUserDetail());
      final res = await Future.wait(uploadTask);

      UserModel user = res.last as UserModel;
      storeProvider.setUser(user);

      setState(() {
        activity = false;
      });

      Helper.showToast(context, "Profile updated successfully");

      // Delay navigation by 2 seconds
      Future.delayed(const Duration(seconds: 1), () {
        AppNavigation.pop(context);
      });

      return;
    }

    setState(() {
      activity = false;
    });
  }

  Widget get editIcon {
    return const Icon(
      Icons.edit,
      color: Colors.black,
      size: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Personal Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ProfileHeader(
                imageFile: imageFile,
                bannerFile: bannerFile,
                bannerUrl: bannerUrl,
                imageUrl: imageUrl,
                onTapBanner: () {
                  Picker.openGallery((path) {
                    setState(() {
                      bannerFile = File(path);
                    });
                  });
                },
                onTapImage: () {
                  Picker.openGallery((path) {
                    setState(() {
                      imageFile = File(path);
                    });
                  });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                textEditingController: firstName,
                placeholder: "Enter first name",
                label: "First name",
                suffixIcon: editIcon,
                onChanged: (value) {
                  setState(() {
                    firstName.text = value;
                  });
                },
              ),
              item_spacer,
              CustomTextField(
                textEditingController: lastName,
                placeholder: "Enter last name",
                label: "Last name",
                suffixIcon: editIcon,
                onChanged: (value) {
                  setState(() {
                    lastName.text = value;
                  });
                },
              ),
              item_spacer,
              CustomTextField(
                textEditingController: userName,
                placeholder: "Enter user name",
                label: "Username",
                suffixIcon: editIcon,
                onChanged: validateUserName,
                activity: getFieldActivityByType(FieldTypes.userName),
                error: getErrorMessageByType(FieldTypes.userName),
              ),
              item_spacer,
              CustomTextField(
                textEditingController: mobile,
                placeholder: "Enter phone number",
                label: "Phone",
                isMobileNumber: true,
                countryCode: countryCode.text,
                suffixIcon: editIcon,
                onChanged: validateMobile,
                activity: getFieldActivityByType(FieldTypes.mobile),
                error: getErrorMessageByType(FieldTypes.mobile),
              ),
              item_spacer,
              CustomTextField(
                textEditingController: email,
                placeholder: "Enter email address",
                label: "Email",
                onChanged: validateEmail,
                activity: getFieldActivityByType(FieldTypes.email),
                error: getErrorMessageByType(FieldTypes.email),
              ),
              item_spacer,
              CustomTextField(
                textEditingController: location,
                placeholder: "Select location",
                label: "Location",
                isLocation: true,
                isDropDown: true,
                enabled: false,
                onSelectAddress: (address) {
                  setState(() {
                    location.text = address.address;
                    locationData = address;
                  });
                },
              ),
              item_spacer,
              CustomTextField(
                textEditingController: about,
                placeholder: "Enter about you",
                label: "About yourself",
                maxLines: 5,
                maxLength: 500,
                suffixIcon: editIcon,
                onChanged: (value) {
                  setState(() {
                    about.text = value;
                  });
                },
              ),
              const SizedBox(
                height: 100,
              ),
              SafeArea(
                child: AppButton(
                  title: "Save",
                  onTap: onSubmit,
                  disabled: !isFieldUpdated(),
                  isLoading: activity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final VoidCallback onTapImage;
  final VoidCallback onTapBanner;
  final File? imageFile;
  final File? bannerFile;
  final String? imageUrl;
  final String? bannerUrl;

  final double bannerHeight = 150;

  const ProfileHeader(
      {super.key,
      required this.onTapBanner,
      required this.onTapImage,
      this.imageFile,
      this.bannerFile,
      this.imageUrl,
      this.bannerUrl});

  Widget get editButton {
    return Container(
      child: Center(
          child: SizedBox(
        child: IconButton(
          onPressed: onTapImage,
          icon: const Icon(Icons.edit),
          color: AppColor.darkGrey,
        ),
      )),
    );
  }

  Widget get editBannerButton {
    return Container(
      child: Center(
          child: SizedBox(
        child: IconButton(
          onPressed: onTapBanner,
          icon: const Icon(Icons.edit),
          color: AppColor.darkGrey,
        ),
      )),
    );
  }

  Widget get renderBanner {
    if (bannerFile != null) {
      return Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                bannerFile!,
                width: double.infinity,
                height: bannerHeight,
                fit: BoxFit.cover,
              )),
          Positioned(right: 0, bottom: 0, child: editBannerButton)
        ],
      );
    }
    if (bannerUrl != null && bannerUrl!.isNotEmpty) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AppImage(
              url: bannerUrl!,
              width: double.infinity,
              height: bannerHeight,
            ),
          ),
          Positioned(right: 0, bottom: 0, child: editBannerButton)
        ],
      );
    }
    return (Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          "assets/images/placeholder.png",
          width: 35,
          height: 35,
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: onTapBanner,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Text(
              "Upload banner",
              style: TextStyle(fontSize: 10, color: AppColor.darkGrey),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ));
  }

  Widget get profileImage {
    if (imageFile != null) {
      return CircleAvatar(
        radius: 50,
        backgroundImage: FileImage(imageFile!),
      );
    }
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return UserCircleImage(
        url: imageUrl!,
        radius: 50,
      );
    }
    return const CircleAvatar(
      radius: 50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: bannerHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade300),
                child: renderBanner,
              ),
              // AppImage(url: "", width: double.infinity, height: 150,),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: profileImage,
            ),
          ),
          Positioned(bottom: 0, right: 0, left: 70, child: editButton)
        ],
      ),
    );
  }
}
