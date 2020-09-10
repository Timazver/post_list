
import 'package:post_list/data/datastore/network/model/requests/post_comments_request.dart';
import 'package:post_list/data/datastore/network/services/network_service.dart';
import 'package:post_list/domain/model/comment.dart';
import 'package:post_list/domain/model/post.dart';
import 'package:post_list/data/datastore/network/model/requests/post_list_request.dart';
import 'package:post_list/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {

  @override
  Future<List<Post>> fetchPosts(PostListRequest request) async {
    var response = await NetworkService.networkService.request(request.endpoint, request.method, request.headers);

    try {
      List<Post> list = []; 
      (response as List).forEach((element) {
        list.add(Post.fromJson(element));
      });
      return list;
    } catch (error) {
      return Future.error("Произошла ошибка");
    }
  }

  @override
  Future<List<Comment>> fetchComments(PostCommentsRequest request) async {
    var response = await NetworkService.networkService.request(request.endpoint, request.method, request.headers);
    try {
      List<Comment> comments = []; 
      (response as List).forEach((element) {
        comments.add(Comment.fromJson(element));
      });
      return comments;
    } catch (error) {
      return Future.error("Произошла ошибка");
    }
  }

}