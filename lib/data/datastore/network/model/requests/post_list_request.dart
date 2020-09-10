import 'package:post_list/data/datastore/network/config/backend_config.dart';
import 'package:post_list/data/datastore/network/http_method.dart';
import 'package:post_list/data/datastore/network/protocols/backend_request.dart';

class PostListRequest implements BackendRequest {

  @override
  String get endpoint => "https://my-json-server.typicode.com/TimaZver/demo/posts";

  @override
  Map<String, String> headers = BackendConfig.headers;

  @override
  HttpMethod method = HttpMethod.GET;

  @override
  Map<String, dynamic> toJson() => {};

}