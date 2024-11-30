import 'dart:convert';

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

Future<void> removeUserFromSharedPreference()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}
