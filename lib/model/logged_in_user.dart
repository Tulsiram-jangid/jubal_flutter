import 'package:my_app/store/SharedPrefrenceStorage.dart';

class LoggedInUser {
  final String id;
  final String? email;
  final String? password;
  final String? mobile;
  final String type;

  LoggedInUser(
      {required this.id,
      required this.type,
      this.email,
      this.mobile,
      this.password});

  // Convert a LoggedInUser to a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'mobile': mobile,
      'type': type,
    };
  }

  // Create a LoggedInUser from a Map (JSON)
  factory LoggedInUser.fromJson(Map<String, dynamic> json) {
    return LoggedInUser(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      mobile: json['mobile'],
      type: json['type'],
    );
  }

  static Future<List<LoggedInUser>> getLoggedInUserList() async {
    final res = await getUserFromLoggedInSharedPreference();
    return res;
  }

  static Future<void> setUserList(List<LoggedInUser> users) async {
    saveUserToLoggedInSharedPreference(users);
  }

  static setLoggedInUser(
      {String? id,
      String? email,
      String? password,
      String? mobile,
      String? type}) async {
    final users = await getUserFromLoggedInSharedPreference();
    try {
      final userFound = users.firstWhere((item) => item.id == id);
    } catch (e) {
      LoggedInUser _user = LoggedInUser(
          id: id ?? "",
          email: email,
          mobile: mobile,
          password: password,
          type: type ?? "");
      users.add(_user);
      saveUserToLoggedInSharedPreference(users);
    }
  }
}
