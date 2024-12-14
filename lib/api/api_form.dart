class ApiForm {
  static Map<String, dynamic> getRegisterForm({
    String? email,
    String? phone,
    String? countryCode,
    String? password,
    String? loggedInBy,
    String? username,
    String? type,
    String? deviceId = "dsdsds",
    String? deviceToken = "dsdsdsds",
    String? firstName,
    String? lastName,
    String? about,
    String? gender,
    String? otp,
  }) {
    Map<String, dynamic> form = {};
    form['email'] = email;
    form['phone'] = phone;
    form['countryCode'] = countryCode;
    form['password'] = password;
    form['loggedInBy'] = loggedInBy;
    form['username'] = username;
    form['type'] = type;
    form['deviceId'] = deviceId;
    form['deviceToken'] = deviceToken;
    form['firstName'] = firstName;
    form['lastName'] = lastName;
    form['about'] = about;
    form['gender'] = gender;
    form['otp'] = otp;
    return form;
  }

  static Map<String, dynamic> getJubalStoreForm({
    bool? inStock = true,
    int? page = 1,
    String? sortField = "instrument_name",
    String? sortType = "ASC",
  }) {
    Map<String, dynamic> form = {};
    form['inStock'] = inStock;
    form['page'] = page;
    form['sortField'] = sortField;
    form['sortType'] = sortType;
    return form;
  }

  static Map<String, dynamic> getAddAddressForm({
    String? name,
    Map<String, dynamic>? location,
    String? type,
    String? zipcode,
    String? phone,
    String? countryCode,
    String? fax,
    String? email,
    String? office_phone,
    String? office_phone_country_code,
    String? recovery_email,
    bool? isDefault,
  }) {
    Map<String, dynamic> form = {};
    form['name'] = name;
    form['location'] = location;
    form['type'] = type;
    form['zipcode'] = zipcode;
    form['phone'] = phone;
    form['countryCode'] = countryCode;
    form['fax'] = fax;
    form['email'] = email;
    form['office_phone'] = office_phone;
    form['office_phone_country_code'] = office_phone_country_code;
    form['recovery_email'] = recovery_email;
    form['isDefault'] = isDefault;
    return form;
  }

  static Map<String, dynamic> getChangePasswordForm({
    String? email,
    String? phone,
    String? countryCode,
    required String currentPassword,
    required String newPassword,
  }) {
    Map<String, dynamic> form = {};
    if (email != null && email.isNotEmpty) {
      form['email'] = email;
    }
    if (phone != null && phone.isNotEmpty) {
      form['phone'] = phone;
      form['countryCode'] = countryCode;
    }
    form['currentPassword'] = currentPassword;
    form['newPassword'] = newPassword;
    return form;
  }

  static Map<String, dynamic> getUserProfileForm({
    String? firstName,
    String? lastName,
    String? startTime,
    String? endTime,
    String? location,
    String? about,
    String? email,
    String? username,
    String? phone,
    String? countryCode,
  }) {
    Map<String, dynamic> form = {};
    Map<String, dynamic> obj = {
      "firstName"     :     firstName   ??  null,
      "lastName"      :     lastName    ??  null,
      "startTime"     :     startTime   ??  null,
      "endTime"       :     endTime     ??  null,
      "location"      :     location    ??  null,
      "about"         :     about       ??  null,
      "email"         :     email       ??  null,
      "username"      :     username    ??  null,
      "phone"         :     phone       ??  null,
      "countryCode"   :     countryCode ??  null
    };

    obj.forEach((key,value){
      if(value != null){
        form[key] = value;
      }
    });

    return form;
  }
}
