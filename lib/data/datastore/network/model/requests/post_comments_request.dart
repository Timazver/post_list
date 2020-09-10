import 'package:post_list/data/datastore/network/config/backend_config.dart';
import 'package:post_list/data/datastore/network/protocols/backend_request.dart';

import '../../http_method.dart';

class PostCommentsRequest implements BackendRequest {

  final int postId;

  PostCommentsRequest({this.postId});
  
  @override
  String get endpoint => "https://jsonplaceholder.typicode.com/posts/$postId/comments";

  @override
  Map<String, String> headers = BackendConfig.headers;

  @override
  HttpMethod method = HttpMethod.GET;

  @override
  Map<String, dynamic> toJson() => {};

}