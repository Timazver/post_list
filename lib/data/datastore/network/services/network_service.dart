import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:post_list/data/datastore/network/config/backend_config.dart';
import 'package:xrange/num_range.dart';

import '../http_method.dart';

class NetworkService {

  Dio _dio = new Dio();
  
  NumRange _successCodes = NumRange.closed(200, 299);

  static NetworkService networkService = NetworkService();

  Future<dynamic> request(
      String url, HttpMethod method, Map<String, String> headers,
      {Map<String, dynamic> parameters}) async {
    
    _dio.options.headers = headers;
    print(url);
    Response response;
    try {
    switch (method) {
      case HttpMethod.GET:
        {
          if(url.contains("comments")) {
            _dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);
            response = await _dio.get(url, options: buildCacheOptions(Duration(days: 5)));
          }
          response = await _dio.get(url);
        }
        break;
      case HttpMethod.POST:
        response = await _dio.post(url, data: parameters);
        break;
      case HttpMethod.PUT:
        response = await _dio.put(url, data: parameters);
        break;
      case HttpMethod.DELETE:
        response = await _dio.delete(url);
        break;
    }
    } on DioError catch (error) {
      print(error.response.data);
      return Future.error(error.response.data);
    }
    print(response.data);
    if (response != null) {
      if (_successCodes.contains(response.statusCode)) {
        return response.data;
      }
    }
  }
}
