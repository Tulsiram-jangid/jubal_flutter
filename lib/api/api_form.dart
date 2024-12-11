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
    String? location,
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
}
