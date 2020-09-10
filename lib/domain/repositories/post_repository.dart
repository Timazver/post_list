
import 'package:post_list/data/datastore/network/model/requests/post_comments_request.dart';
import 'package:post_list/data/datastore/network/model/requests/post_list_request.dart';
import 'package:post_list/domain/model/comment.dart';
import 'package:post_list/domain/model/post.dart';

abstract class PostRepository {

  Future<List<Post>> fetchPosts(PostListRequest request);
  Future<List<Comment>> fetchComments(PostCommentsRequest request);
}