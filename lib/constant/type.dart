class FieldTypes {
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String userName = "userName";
  static const String email = "email";
  static const String mobile = "mobile";
  static const String countryCode = "countryCode";
  static const String password = "password";
  static const String confirmPassword = "confirmPassword";

  //for tabs
  static const String post = "post";
  static const String event = "event";
  static const String instrument = "instrument";

  //address
  static const String officeMobile = "officeMobile";
  static const String recoveryEmail = "recoveryEmail";
  static const String faxNumber = "faxNumber";
  static const String location = "location";
  static const String city = "city";
  static const String state = "state";
  static const String country = "country";
  static const String zipCode = "zipCode";
  static const String addressType = "addressType";


  //Bottom Sheet options
  static const String home = "home";
  static const String office = "office";
  static const String delete = "delete";
  static const String makeDefault = "makeDefault";
  
  //Change Password
  static const String currentPassword = "currentPassword";
  static const String newPassword = "newPassword";
}

enum MyProfileTypes { logout }

enum EventStatusTypes {
  pending('0'),
  closed('1'),
  started('2'),
  published('3'),
  rejected('4');

  const EventStatusTypes(this.value);
  final String value;
}

enum UserTypes {
  fan(1),
  vendor(2),
  talent(3);
  

  const UserTypes(this.value);
  final int value;
}

String getEventStatusText(String status) {
  if (status == EventStatusTypes.pending.value) {
    return "Draft";
  }
  if (status == EventStatusTypes.closed.value) {
    return "Closed";
  }
  if (status == EventStatusTypes.published.value) {
    return "Published";
  }
  if (status == EventStatusTypes.rejected.value) {
    return "Rejected";
  }
  return "";
}
