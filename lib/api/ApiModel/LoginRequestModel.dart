import 'dart:convert';

class LoginRequestModel {
  String message;
  int statusCode;
  Data data;
  bool status;

  LoginRequestModel({
    required this.message,
    required this.statusCode,
    required this.data,
    required this.status,
  });

  // From JSON constructor
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'] != null ? Data.fromJson(json['data']) : Data(),
      status: json['status'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    data['data'] = this.data.toJson();
    data['status'] = status;
    return data;
  }
}

class Data {
  String accessToken;
  String refreshToken;
  String id;
  String email;
  String username;
  String countryCode;
  int phone;
  String password;
  String oldPasswords;
  bool isVerified;
  bool isEmailVerified;
  bool isPhoneVerified;
  bool isBlocked;
  int type;
  bool isProfileUpdated;
  String createdAt;
  String updatedAt;
  dynamic deletedAt; // Use dynamic or null instead of Null
  Profile profile;
  String deviceId;
  String deviceToken;
  bool isPlanPurchased;

  Data({
    this.accessToken = '',
    this.refreshToken = '',
    this.id = '',
    this.email = '',
    this.username = '',
    this.countryCode = '',
    this.phone = 0,
    this.password = '',
    this.oldPasswords = '',
    this.isVerified = false,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.isBlocked = false,
    this.type = 0,
    this.isProfileUpdated = false,
    this.createdAt = '',
    this.updatedAt = '',
    this.deletedAt,
    this.profile = const Profile(),
    this.deviceId = '',
    this.deviceToken = '',
    this.isPlanPurchased = false,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      countryCode: json['countryCode'] ?? '',
      phone: json['phone'] ?? 0,
      password: json['password'] ?? '',
      oldPasswords: json['oldPasswords'] ?? '',
      isVerified: json['isVerified'] ?? false,
      isEmailVerified: json['isEmailVerified'] ?? false,
      isPhoneVerified: json['isPhoneVerified'] ?? false,
      isBlocked: json['isBlocked'] ?? false,
      type: json['type'] ?? 0,
      isProfileUpdated: json['isProfileUpdated'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      deletedAt: json['deletedAt'],
      profile: json['profile'] != null ? Profile.fromJson(json['profile']) : const Profile(),
      deviceId: json['deviceId'] ?? '',
      deviceToken: json['deviceToken'] ?? '',
      isPlanPurchased: json['isPlanPurchased'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['countryCode'] = countryCode;
    data['phone'] = phone;
    data['password'] = password;
    data['oldPasswords'] = oldPasswords;
    data['isVerified'] = isVerified;
    data['isEmailVerified'] = isEmailVerified;
    data['isPhoneVerified'] = isPhoneVerified;
    data['isBlocked'] = isBlocked;
    data['type'] = type;
    data['isProfileUpdated'] = isProfileUpdated;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['profile'] = profile.toJson();
    data['deviceId'] = deviceId;
    data['deviceToken'] = deviceToken;
    data['isPlanPurchased'] = isPlanPurchased;
    return data;
  }
}

class Profile {
  final String id;
 final String firstName;
 final String lastName;
 final String artistBandName;
 final dynamic companyName; // Use dynamic instead of Null
 final int gender;
 final bool isDocumentVerified;
 final String profilePhoto;
 final String profileBanner;
 final String location;
 final double latitude;
 final double longitude;
 final String about;
 final dynamic previousSearch; // Use dynamic instead of Null
 final int searchCount;
 final int followerCount;
 final int rating;
 final String age;
 final String createdAt;
 final String updatedAt;
 final dynamic deletedAt; // Use dynamic instead of Null
 final String userId;

  const Profile({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.artistBandName = '',
    this.companyName,
    this.gender = 0,
    this.isDocumentVerified = false,
    this.profilePhoto = '',
    this.profileBanner = '',
    this.location = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.about = '',
    this.previousSearch,
    this.searchCount = 0,
    this.followerCount = 0,
    this.rating = 0,
    this.age = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.deletedAt,
    this.userId = '',
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      artistBandName: json['artistBandName'] ?? '',
      companyName: json['companyName'],
      gender: json['gender'] ?? 0,
      isDocumentVerified: json['isDocumentVerified'] ?? false,
      profilePhoto: json['profilePhoto'] ?? '',
      profileBanner: json['profileBanner'] ?? '',
      location: json['location'] ?? '',
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      about: json['about'] ?? '',
      previousSearch: json['previousSearch'],
      searchCount: json['searchCount'] ?? 0,
      followerCount: json['followerCount'] ?? 0,
      rating: json['rating'] ?? 0,
      age: json['age'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      deletedAt: json['deletedAt'],
      userId: json['userId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['artistBandName'] = artistBandName;
    data['companyName'] = companyName;
    data['gender'] = gender;
    data['isDocumentVerified'] = isDocumentVerified;
    data['profilePhoto'] = profilePhoto;
    data['profileBanner'] = profileBanner;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['about'] = about;
    data['previousSearch'] = previousSearch;
    data['searchCount'] = searchCount;
    data['followerCount'] = followerCount;
    data['rating'] = rating;
    data['age'] = age;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['userId'] = userId;
    return data;
  }
}
