import '../data_state/data_state.dart';
import '../enum/method_type_enum.dart';

abstract class ApiClient {
  ///Returns generic "ApiResponse"
  Future<ApiResponse<T>> request<T,G>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? queryParameters,
    T Function(G json)? fromJson,
  });

  void setToken(String token);
  void removeToken();
  Future<String?> getLocalToken();
  String handleException(Exception exception);
}
