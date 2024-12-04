class FieldTypes {
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String userName = "userName";
  static const String email = "email";
  static const String mobile = "mobile";
  static const String countryCode = "countryCode";
  static const String password = "password";
  static const String confirmPassword = "confirmPassword";
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
  if(status == EventStatusTypes.pending.value){
    return "Draft";
  }
  if(status == EventStatusTypes.closed.value){
    return "Closed";
  }
  if(status == EventStatusTypes.published.value){
    return "Published";
  }
  if(status == EventStatusTypes.rejected.value){
    return "Rejected";
  }
  return "";
}
