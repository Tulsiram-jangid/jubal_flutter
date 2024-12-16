import 'dart:convert';

class UserModel {
  Map<String, dynamic> user;

  UserModel({required this.user});

  String get id => user['id'];
  String get firstName => user['Profile']['firstName'];
  String get lastName => user['Profile']['lastName'];
  String get getFullName => "${firstName} ${lastName}";
  String get username => user['username'];
  String get email => user['email'];
  String get countryCode => user['countryCode'];
  String get location => user['Profile']['location'] ?? "";

  int get phone => user['phone'];
  bool get isVerified => user['isVerified'];
  bool get isEmailVerified => user['isEmailVerified'];
  bool get isPhoneVerified => user['isPhoneVerified'];
  bool get isBlocked => user['isBlocked'];
  int get type => user['type'];

  String get profilePhoto => user['Profile']['profilePhoto'] ?? "";
  String get profileBanner => user['Profile']['profileBanner'] ?? "";
  String get about => user['Profile']['about'] ?? "";
  String get age => user['Profile']['age'] ?? "";

  List<String> get service {
    final services = user['Vendor']?['services'] ?? [];
    try {
      if (services is String) {
        final List<dynamic> decoded = jsonDecode(services);
        return decoded.whereType<String>().toList();
      } else if (services is List) {
        return services.whereType<String>().toList();
      }
    } catch (e) {
      print("Error decoding services: $e");
    }
    return [];
  }

  List<String> get category {
    final services = user['Talent']?['catagory'] ?? [];
    try {
      if (services is String) {
        final List<dynamic> decoded = jsonDecode(services);
        return decoded.whereType<String>().toList();
      } else if (services is List) {
        return services.whereType<String>().toList();
      }
    } catch (e) {
      print("Error decoding services: $e");
    }
    return [];
  }
}


// class UserModel {



//   String? id;
//   String? firstName;
//   String? lastName;
//   String? username;
//   String? email;
//   String? countryCode;
//   int? phone;
//   bool? isVerified;
//   bool? isEmailVerified;
//   bool? isPhoneVerified;
//   bool? isBlocked;
//   int? type;
//   bool? isDocumentVerified;
//   String? profilePhoto;
//   String? profileBanner;
//   String? location;
//   double? latitude;
//   double? longitude;
//   String? about;
//   String? age;
//   String? deviceId;
//   bool? isPlanPurchased;

//   UserModel({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.username,
//     this.email,
//     this.countryCode,
//     this.phone,
//     this.isVerified,
//     this.isEmailVerified,
//     this.isPhoneVerified,
//     this.isBlocked,
//     this.type,
//     this.isDocumentVerified,
//     this.profileBanner,
//     this.profilePhoto,
//     this.location,
//     this.latitude,
//     this.longitude,
//     this.about,
//     this.age,
//     this.deviceId,
//     this.isPlanPurchased
//   });

//   String getFullName(){
//     String name = "";
//     if(firstName != null){
//       name = firstName!;
//     }
//     if(lastName != null){
//       name = "${name} ${lastName}";
//     }
//     return name;
//   }


//   static UserModel getUserFromLoginApi(Map<String, dynamic> res){
//     late UserModel userModel;
//     Map<String, dynamic> profile = new Map<String,dynamic>();
//     profile = res['Profile'];

//     userModel = UserModel(
//       id: res['id'],
//       firstName: profile['firstName'],
//       lastName: profile['lastName'],
//       username: res['username'],
//       email: res['email'],
//       countryCode: res['countryCode'],
//       phone: res['phone'],
//       isEmailVerified: res['isEmailVerified'],
//       isPhoneVerified: res['isPhoneVerified'],
//       isBlocked: res['isBlocked'],
//       isDocumentVerified: profile['isDocumentVerified'],
//       profileBanner: profile['profileBanner'],
//       profilePhoto: profile['profilePhoto'],
//       type: res['type'],
//       latitude: profile['latitude'],
//       location: profile['location'],
//       longitude: profile['longitude'],
//       about: profile['about'],
//       age: profile['age'],
//       deviceId: res['deviceId'],
//       isPlanPurchased: res['isPlanPurchased'],
//     );
//     return userModel;
//   }

// }