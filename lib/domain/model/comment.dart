import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(nullable: true)
class Comment {

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({this.body, this.id, this.name, this.email, this.postId});

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  
}