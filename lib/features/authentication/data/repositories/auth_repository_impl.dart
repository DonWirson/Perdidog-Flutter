import 'package:dartz/dartz.dart';

import '../../../../core/data_state/data_state.dart';
import '../../../../core/data_state/failure.dart';
import '../../domain/entities/jwt_token.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';
import '../datasources/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(
    this._authService,
  );

  @override
  Future<Either<Failure, ApiResponse<bool>>> registerUser(
      RegisterRequestDto useCaseParams) async {
    try {
      final apiResponse = await _authService.registerUser(useCaseParams);

      return right(apiResponse);
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ApiResponse<JwtToken>>> loginUser(
      LoginRequestDto useCaseParams) async {
    try {
      final apiResponse = await _authService.loginUser(useCaseParams);

      return right(apiResponse);
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }
}
