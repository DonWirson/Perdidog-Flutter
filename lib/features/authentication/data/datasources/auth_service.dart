import '../../domain/entities/jwt_token.dart';
import '../../domain/usecases/login_user.dart';

import '../../../../core/api/api_client_interface.dart';
import '../../../../core/data_state/data_state.dart';
import '../../../../core/enum/method_type_enum.dart';
import '../../domain/usecases/register_user.dart';

class AuthService {
  final ApiClient apiClient;

  AuthService({
    required this.apiClient,
  });

  final endpointUrl = '/Auth';

  Future<ApiResponse<bool>> registerUser(
      RegisterUserUseCaseParams params) async {
    Map<String, dynamic> headers = {
      "username": params.username,
      "password": params.password,
      "roles": params.roles,
    };

    final response = await apiClient.request<bool>(
      path: "$endpointUrl/Register",
      method: MethodType.post,
      payload: headers,
    );

    return response;
  }

  Future<ApiResponse<JwtToken>> loginUser(LoginUserUseCaseParams params) async {
    Map<String, dynamic> headers = {
      "username": params.username,
      "password": params.password,
    };

    final response = await apiClient.request<JwtToken>(
      path: "$endpointUrl/Login",
      method: MethodType.post,
      payload: headers,
      fromJson: (json) => JwtToken.fromMap(json),
    );

    return response;
  }
}