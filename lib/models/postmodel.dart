

// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  String name;
  String mobile;
  String password;

  Posts({
    required this.name,
    required this.mobile,
    required this.password,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    name: json["Name"],
    mobile: json["Mobile"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Mobile": mobile,
    "password": password,
  };
}
