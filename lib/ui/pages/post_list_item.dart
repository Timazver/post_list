import 'package:flutter/material.dart';
import 'package:post_list/domain/model/post.dart';
import 'package:post_list/ui/styles_&_colors/custom_colors.dart';

class PostListItem extends StatelessWidget {
  
  final Post post;

  PostListItem({this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      //   boxShadow: [
      //           BoxShadow(
      //             color: Colors.black.withOpacity(0.5),
      //             spreadRadius: 0,
      //             blurRadius: 10,
      //             offset: Offset(0, 6),
      //           )]
      ),
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: NetworkImage(post.image))
          )
        ),
        title: Text(post.title)
      )
    );
  }
}