import 'package:dio/dio.dart';

class BackendConfig {

  static BaseOptions options = new BaseOptions(
    baseUrl: "https://my-json-server.typicode.com",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  
  static const Map<String, String> headers = {
    "Content-Type": "application/json"
  };
}
