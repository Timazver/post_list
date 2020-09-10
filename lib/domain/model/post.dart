import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(nullable: true)
class Post {

  final int id;
  final String image;
  final String title;
  final String body;

  Post({this.body, this.id, this.image, this.title});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  
}