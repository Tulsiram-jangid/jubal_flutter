import 'dart:convert';

class Post {
  final int id;
  final String title;
  final String body;

  // Constructor
  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory constructor to create a Post instance from a JSON map
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Method to convert a Post instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
