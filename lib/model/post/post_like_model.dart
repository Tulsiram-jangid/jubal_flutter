import 'dart:convert';

class PostLikeModel {
  final Map<String, dynamic> postLike;

  PostLikeModel({
    required this.postLike
  });


  String get postImage{
    if(postLike['Post'] != null && postLike['Post']['postImageUrl'] != null){
      return postLike['Post']['postImageUrl'];
    }
    return "";
  }

  String get userFullName{
    if(postLike['Post'] != null && postLike['Post']['User']['firstName'] != null){
      String fullName = '${postLike['Post']['User']['firstName']} ${postLike['Post']['User']['lastName']}';
      return fullName;
    }
    return "";
  }

  String get userImage{
    if(postLike['Post'] != null && postLike['Post']['User']['profilePhoto'] != null){
      return postLike['Post']['User']['profilePhoto'];
    }
    return "";
  }

  String get getCategory {
    if(postLike['Post'] != null && postLike['Post']['User']['Talent'] != null && postLike['Post']['User']['Talent']['catagory'] != null){
      List<dynamic> cates = jsonDecode(postLike['Post']['User']['Talent']['catagory']) as List<dynamic>;
      if(cates.isNotEmpty){
        return cates.first;
      }
    }
    return "";
  }

}