import 'dart:convert';

class TalentDetailModel {
  final Map<String, dynamic> talent;

  TalentDetailModel({required this.talent});

  String get profilePhoto {
    if (talent['Profile'] != null &&
        talent['Profile']['profilePhoto'] != null) {
      return talent['Profile']['profilePhoto'];
    }
    return "";
  }

  String get profileBanner {
    if (talent['Profile'] != null &&
        talent['Profile']['profileBanner'] != null) {
      return talent['Profile']['profileBanner'];
    }
    return "";
  }

  String get firstName => talent['Profile']['firstName'] ?? "";
  String get lastName => talent['Profile']['lastName'] ?? "";
  String get about => talent['Profile']['about'] ?? "";
  String get fullName => "$firstName $lastName";
  String get category {
    if (talent['Talent'] != null) {
      List<dynamic> cates = jsonDecode(talent['Talent']['catagory']);
      if (cates.length > 0) {
        return cates.first;
      }
    }
    return "";
  }

  List<String> get instrumentList {
    if (talent['Talent'] != null && talent['Talent']['instrument'] != null) {
      List<dynamic> dynamicList = jsonDecode(talent['Talent']['instrument']);
      return dynamicList.cast<String>();
    }
    return [];
  }

  List<String> get genreList {
    if (talent['Talent'] != null && talent['Talent']['genre'] != null) {
      List<dynamic> dynamicList = jsonDecode(talent['Talent']['genre']);
      return dynamicList.cast<String>();
    }
    return [];
  }

  List<dynamic> get socialUrls {
    if (talent['Talent'] != null) {
      List<dynamic> list = jsonDecode(talent['Talent']['socialurls']);
      return list;
    }
    return [];
  }
}
