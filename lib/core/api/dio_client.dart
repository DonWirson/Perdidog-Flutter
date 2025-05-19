import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data_state/data_state.dart';
import '../enum/method_type_enum.dart';
import 'api_client_interface.dart';

class DioClient implements ApiClient {
  late Dio _client;

  DioClient() {
    final baseApiUrl = dotenv.env['BASE_API_URL'];

    _client = Dio(
      
    )..options.baseUrl = baseApiUrl ?? "";
    
    // ..interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       // options.queryParameters['api_key'] = 'your-api-key';
    //       return handler.next(options);
    //     },
    //   ),
    // );
  }

  @override
  void removeToken() {
    _client.options.headers.remove('Authorization');
  }

  ///Save token locally and applies it to the header of the api calls
  @override
  void setToken(String token) {
    _client.options.headers['Authorization'] = 'Bearer $token';
    //Save jwtToken to localStorage, later used to validate if user is logged in
    setLocalToken(token);
  }

  @override
  String handleException(Exception exception) {
    // TODO: implement handleException
    throw UnimplementedError();
  }

  @override
  Future<String?> getLocalToken() async {
    const storage = FlutterSecureStorage();

    return await storage.read(key: "jwtToken");
  }

  setLocalToken(String jwtToken) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "jwtToken", value: jwtToken);
  }

  @override
  Future<ApiResponse<T>> request<T, G>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? queryParameters,
    T Function(G json)? fromJson,
  }) async {
    ApiResponse<T> apiResponse;
    Response response;
    try {
      switch (method) {
        case MethodType.get:
          response = await _client.get(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.post:
          response = await _client.post(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.put:
          response = await _client.put(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.delete:
          response = await _client.delete(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.patch:
          response = await _client.patch(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
      }
      apiResponse = ApiResponse(
        data: fromJson == null ? response.data : fromJson(response.data),
        statusCode: response.statusCode,
        success: true,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      apiResponse = ApiResponse(
        data: null,
        statusCode: e.stackTrace.hashCode,
        statusMessage: e.message,
        success: false,
      );
      log(e.toString());
    } catch (e) {
      apiResponse = ApiResponse(
        data: null,
        statusMessage: e.toString(),
        success: false,
      );
    }
    return apiResponse;
  }
}
