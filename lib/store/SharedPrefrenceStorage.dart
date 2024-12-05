import 'dart:convert';

import 'package:my_app/model/logged_in_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const key = "jubal_talents_app_2121212121";

Future<void> setUserToSharedPreference(Map<String, dynamic> user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    String jsonString = jsonEncode(user);
    prefs.setString(key, jsonString);
  } catch (e) {
    print("unable to save details in shared preference");
  }
}

Future<Map<String, dynamic>?> getUserFromSharedPreference() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    final jsonString = prefs.getString(key) as String;
    Map<String, dynamic>? obj = null;
    obj = jsonDecode(jsonString);
    return obj;
  } catch (e) {
    print("unable to get details from shared preference");
    return null;
  }
}

Future<void> removeUserFromSharedPreference() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}

//For remember user
const loggedInUserKey = "jubal_talents_logged_in_user_app_2121212121";
/// Save user to SharedPreferences
Future<void> saveUserToLoggedInSharedPreference(List<LoggedInUser> users) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // Convert list of users to a list of JSON strings
  List<String> userListJson = users.map((user) => jsonEncode(user.toJson())).toList();
  // Save the list as a single JSON-encoded string
  await prefs.setStringList(loggedInUserKey, userListJson);
}

/// Retrieve user from SharedPreferences
Future<List<LoggedInUser>> getUserFromLoggedInSharedPreference() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // Get the list of JSON strings
  List<String>? userListJson = prefs.getStringList(loggedInUserKey);

  if (userListJson == null || userListJson.isEmpty) {
    return []; // Return an empty list if no data exists
  }

  // Convert JSON strings back to LoggedInUser objects
  List<LoggedInUser> users = userListJson.map((userJson) {
    Map<String, dynamic> userMap = jsonDecode(userJson);
    return LoggedInUser.fromJson(userMap);
  }).toList();

  return users;
}
