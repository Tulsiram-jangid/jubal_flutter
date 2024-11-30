import 'dart:convert';

class PostModel {
  String? id;
  String? caption;
  String? postImageUrl;
  String? userId;
  String? title;
  String? mediaType;
  String? location;
  String? genre;
  String? postStatus;
  int? audienceVisibility;
  List<Null>? tags;
  String? whoCanView;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  bool? isLikedByMe;
  bool? isFollowedByMe;
  bool? isUserReportedByMe;
  bool? isFollowedRequestByMe;
  bool? isReportedByMe;
  bool? isSavedByMe;
  int? likes;
  LatestComment? latestComment;
  int? comments;
  int? shareCount;
  PostUser? user;

  PostModel(
      {this.id,
      this.caption,
      this.postImageUrl,
      this.userId,
      this.title,
      this.mediaType,
      this.location,
      this.genre,
      this.postStatus,
      this.audienceVisibility,
      this.tags,
      this.whoCanView,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.isLikedByMe,
      this.isFollowedByMe,
      this.isUserReportedByMe,
      this.isFollowedRequestByMe,
      this.isReportedByMe,
      this.isSavedByMe,
      this.likes,
      this.latestComment,
      this.comments,
      this.shareCount,
      this.user});

  static List<PostModel> getFromJsonList(List<dynamic> list) {
    return list.map((item) => PostModel.fromJson(item)).toList();
  }

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    postImageUrl = json['postImageUrl'];
    userId = json['userId'];
    title = json['title'];
    mediaType = json['mediaType'];
    location = json['location'];
    genre = json['genre'];
    postStatus = json['postStatus'];
    audienceVisibility = json['audienceVisibility'];

    whoCanView = json['whoCanView'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    isLikedByMe = json['isLikedByMe'];
    isFollowedByMe = json['isFollowedByMe'];
    isUserReportedByMe = json['isUserReportedByMe'];
    isFollowedRequestByMe = json['isFollowedRequestByMe'];
    isReportedByMe = json['isReportedByMe'];
    isSavedByMe = json['isSavedByMe'];
    likes = json['Likes'];
    latestComment = json['latestComment'] != null
        ? new LatestComment.fromJson(json['latestComment'])
        : null;
    comments = json['Comments'];
    shareCount = json['shareCount'];
    user = json['User'] != null ? new PostUser.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['caption'] = this.caption;
    data['postImageUrl'] = this.postImageUrl;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['mediaType'] = this.mediaType;
    data['location'] = this.location;
    data['genre'] = this.genre;
    data['postStatus'] = this.postStatus;
    data['audienceVisibility'] = this.audienceVisibility;

    data['whoCanView'] = this.whoCanView;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['isLikedByMe'] = this.isLikedByMe;
    data['isFollowedByMe'] = this.isFollowedByMe;
    data['isUserReportedByMe'] = this.isUserReportedByMe;
    data['isFollowedRequestByMe'] = this.isFollowedRequestByMe;
    data['isReportedByMe'] = this.isReportedByMe;
    data['isSavedByMe'] = this.isSavedByMe;
    data['Likes'] = this.likes;
    if (this.latestComment != null) {
      data['latestComment'] = this.latestComment!.toJson();
    }
    data['Comments'] = this.comments;
    data['shareCount'] = this.shareCount;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    return data;
  }
}

class LatestComment {
  String? id;
  String? comment;
  String? userId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? postId;
  Null? commentId;
  User? user;
  int? commentLikes;
  int? commentReplies;
  bool? isLikedByMe;

  LatestComment(
      {this.id,
      this.comment,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.postId,
      this.commentId,
      this.user,
      this.commentLikes,
      this.commentReplies,
      this.isLikedByMe});

  LatestComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    postId = json['postId'];
    commentId = json['commentId'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    commentLikes = json['commentLikes'];
    commentReplies = json['commentReplies'];
    isLikedByMe = json['isLikedByMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['postId'] = this.postId;
    data['commentId'] = this.commentId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['commentLikes'] = this.commentLikes;
    data['commentReplies'] = this.commentReplies;
    data['isLikedByMe'] = this.isLikedByMe;
    return data;
  }
}

class User {
  int? type;
  String? id;
  Profile? profile;
  Vendor? vendor;
  Talent? talent;

  User({this.type, this.id, this.profile, this.vendor, this.talent});

  User.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    profile =
        json['Profile'] != null ? new Profile.fromJson(json['Profile']) : null;
    vendor =
        json['Vendor'] != null ? new Vendor.fromJson(json['Vendor']) : null;
    talent =
        json['Talent'] != null ? new Talent.fromJson(json['Talent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    if (this.profile != null) {
      data['Profile'] = this.profile!.toJson();
    }
    if (this.vendor != null) {
      data['Vendor'] = this.vendor!.toJson();
    }
    if (this.talent != null) {
      data['Talent'] = this.talent!.toJson();
    }
    return data;
  }
}

class Profile {
  String? id;
  String? firstName;
  String? lastName;
  String? artistBandName;
  int? gender;
  String? profilePhoto;
  String? profileBanner;
  String? location;
  String? about;
  String? userId;
  String? createdAt;
  String? age;

  Profile(
      {this.id,
      this.firstName,
      this.lastName,
      this.artistBandName,
      this.gender,
      this.profilePhoto,
      this.profileBanner,
      this.location,
      this.about,
      this.userId,
      this.createdAt,
      this.age});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    artistBandName = json['artistBandName'];
    gender = json['gender'];
    profilePhoto = json['profilePhoto'];
    profileBanner = json['profileBanner'];
    location = json['location'];
    about = json['about'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['artistBandName'] = this.artistBandName;
    data['gender'] = this.gender;
    data['profilePhoto'] = this.profilePhoto;
    data['profileBanner'] = this.profileBanner;
    data['location'] = this.location;
    data['about'] = this.about;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['age'] = this.age;
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

class PostUser {
  int? type;
  String? id;
  String? firstName;
  String? lastName;
  String? profileBanner;
  String? profilePhoto;
  PostTalent? talent;
  Null? vendor;

  PostUser(
      {this.type,
      this.id,
      this.firstName,
      this.lastName,
      this.profileBanner,
      this.profilePhoto,
      this.talent,
      this.vendor});

  PostUser.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profileBanner = json['profileBanner'];
    profilePhoto = json['profilePhoto'];
    talent =
        json['Talent'] != null ? new PostTalent.fromJson(json['Talent']) : null;
    vendor = json['Vendor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profileBanner'] = this.profileBanner;
    data['profilePhoto'] = this.profilePhoto;
    if (this.talent != null) {
      data['Talent'] = this.talent!.toJson();
    }
    data['Vendor'] = this.vendor;
    return data;
  }
}

class PostTalent {
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

  PostTalent(
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

  PostTalent.fromJson(Map<String, dynamic> json) {
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
