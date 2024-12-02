import 'dart:convert';

class TalentListModel {
  final Map<String, dynamic> talent;

  TalentListModel({required this.talent});

  // Getters for basic fields
  String get id => talent['id'] ?? '';
  String get firstName => (talent['firstName'] ?? '').trim();
  String get lastName => (talent['lastName'] ?? '').trim();
  String get fullName {
    String full_name = "${firstName} ${lastName}".trim();
    return "${full_name[0].toUpperCase()}${full_name.substring(1)}";
  }
  String get artistBandName => talent['artistBandName'] ?? '';
  int get gender => talent['gender'] ?? 0;
  String get profilePhoto => talent['profilePhoto'] ?? '';
  String get about => talent['about'] ?? '';
  String get userId => talent['userId'] ?? '';
  int get followerCount => talent['followerCount'] ?? 0;
  double get rating => (talent['rating'] ?? 0).toDouble();

  // Getter for nested User object
  Map<String, dynamic> get user => talent['User'] ?? {};
  String get email => user['email'] ?? '';
  String get phone => user['phone']?.toString() ?? '';
  int get userType => user['type'] ?? 0;

  // Getter for nested Talent object inside User
  Map<String, dynamic> get userTalent => user['Talent'] ?? {};
  String get talentId => userTalent['id'] ?? '';
  
  
  bool get profileVerified => userTalent['profileVerified'] ?? false;

  String get getCategory {
    if(talent['User']['Talent']['catagory'] != null){
      String _cates = talent['User']['Talent']['catagory'] ?? "";
      List<String> cate = _cates.isNotEmpty 
        ? List<String>.from(jsonDecode(_cates) as List<dynamic>) 
        : [];
      return cate.isNotEmpty ? cate.first : "";
    }
    return "";
  }

  String get city {
    if(talent['location'] != null){
      Map<String, dynamic> obj = Map.from(jsonDecode(talent['location']));
      return obj['city'] ?? "";
    }
    return "";
  }

}