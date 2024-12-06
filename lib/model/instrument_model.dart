class InstrumentModel {
  final Map<String, dynamic> instrument;

  InstrumentModel({required this.instrument});

  String get id => instrument['id'] ?? "";
  String get instrumentName => instrument['instrument_name'] ?? "";
  String get about => instrument['about'] ?? "";
  String get brand => instrument['brand'] ?? "";
  String get primaryCategory => instrument['primaryCategory'] ?? "";
  String get secondaryCategory => instrument['secondaryCategory'] ?? "";
  String get primaryCategoryId => instrument['primaryCategoryId'] ?? "";
  String get secondaryCategoryId => instrument['secondaryCategoryId'] ?? "";
  double get sellingPrice {
    if (instrument != null) {
      final price = instrument['selling_price'];
      if (price is int) {
        return price.toDouble();
      } else if (price is double) {
        return price;
      } else if (price is String) {
        return double.tryParse(price) ?? 0.0;
      }
    }
    return 0.0;
  }

  double get instrumentPrice {
    if (instrument != null) {
      final price = instrument['instrument_price'];
      if (price is int) {
        return price.toDouble();
      } else if (price is double) {
        return price;
      } else if (price is String) {
        return double.tryParse(price) ?? 0.0;
      }
    }
    return 0.0;
  }

  String get instrumentImage {
    if (instrument != null && instrument['instrument_image'] != null) {
      final images = instrument['instrument_image'] as List<dynamic>;
      if (images.isNotEmpty) {
        return images.first;
      }
    }
    return "";
  }

  // List<String>? features;

  // Null? instrumentNameId;
  // List<String>? specification;
  // //List<String>? instrumentImage;
  // int? instrumentPrice;
  // double? sellingPrice;
  // String? brand;
  // int? quantity;
  // String? location;
  // String? status;
  // String? userId;
  // int? purchaseCount;
  // Null? reason;
  // double? latitude;
  // double? longitude;
  // String? condition;
  // String? createdAt;
  // String? updatedAt;
  // Null? deletedAt;
  // User? user;
  // int? likes;
}

class User {
  int? type;
  String? id;
  String? username;
  String? email;
  String? countryCode;
  int? phone;
  Talent? talent;
  Vendor? vendor;
  String? location;
  String? firstName;
  String? lastName;
  String? artistBandName;
  String? profilePhoto;
  Null? profileBanner;

  User(
      {this.type,
      this.id,
      this.username,
      this.email,
      this.countryCode,
      this.phone,
      this.talent,
      this.vendor,
      this.location,
      this.firstName,
      this.lastName,
      this.artistBandName,
      this.profilePhoto,
      this.profileBanner});

  User.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    username = json['username'];
    email = json['email'];
    countryCode = json['countryCode'];
    phone = json['phone'];
    talent =
        json['Talent'] != null ? new Talent.fromJson(json['Talent']) : null;
    vendor =
        json['Vendor'] != null ? new Vendor.fromJson(json['Vendor']) : null;
    location = json['location'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    artistBandName = json['artistBandName'];
    profilePhoto = json['profilePhoto'];
    profileBanner = json['profileBanner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['countryCode'] = this.countryCode;
    data['phone'] = this.phone;
    if (this.talent != null) {
      data['Talent'] = this.talent!.toJson();
    }
    if (this.vendor != null) {
      data['Vendor'] = this.vendor!.toJson();
    }
    data['location'] = this.location;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['artistBandName'] = this.artistBandName;
    data['profilePhoto'] = this.profilePhoto;
    data['profileBanner'] = this.profileBanner;
    return data;
  }
}

class Talent {
  String? id;
  String? catagory;
  String? instrument;
  String? genre;
  bool? profileVerified;
  String? socialurls;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? userId;

  Talent(
      {this.id,
      this.catagory,
      this.instrument,
      this.genre,
      this.profileVerified,
      this.socialurls,
      this.startTime,
      this.endTime,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId});

  Talent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catagory = json['catagory'];
    instrument = json['instrument'];
    genre = json['genre'];
    profileVerified = json['profileVerified'];
    socialurls = json['socialurls'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catagory'] = this.catagory;
    data['instrument'] = this.instrument;
    data['genre'] = this.genre;
    data['profileVerified'] = this.profileVerified;
    data['socialurls'] = this.socialurls;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['userId'] = this.userId;
    return data;
  }
}

class Vendor {
  String? id;
  String? services;
  bool? profileVerified;
  String? socialurls;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? userId;

  Vendor(
      {this.id,
      this.services,
      this.profileVerified,
      this.socialurls,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    services = json['services'];
    profileVerified = json['profileVerified'];
    socialurls = json['socialurls'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['services'] = this.services;
    data['profileVerified'] = this.profileVerified;
    data['socialurls'] = this.socialurls;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['userId'] = this.userId;
    return data;
  }
}
