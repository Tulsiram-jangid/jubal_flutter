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
  }){
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
}