// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:perros_sos/core/data_state/data_state.dart';
import 'package:perros_sos/core/data_state/failure.dart';
import 'package:perros_sos/core/use_case/use_case.dart';
import 'package:perros_sos/features/authentication/domain/entities/jwt_token.dart';
import 'package:perros_sos/features/authentication/domain/repositories/auth_repository.dart';

class LoginUserUseCase
    implements
        UseCase<Either<Failure, ApiResponse<JwtToken>>,
            LoginUserUseCaseParams> {
  final AuthRepository authRepository;

  LoginUserUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, ApiResponse<JwtToken>>> call(
      {required LoginUserUseCaseParams params}) {
    return authRepository.loginUser(params);
  }
}

class LoginUserUseCaseParams {
  String username;
  String password;

  LoginUserUseCaseParams({
    required this.username,
    required this.password,
  });
}