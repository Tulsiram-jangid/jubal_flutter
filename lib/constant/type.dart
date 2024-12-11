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
