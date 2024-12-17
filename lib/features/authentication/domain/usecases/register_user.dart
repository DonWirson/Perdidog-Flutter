// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:perros_sos/core/data_state/data_state.dart';
import 'package:perros_sos/core/data_state/failure.dart';
import 'package:perros_sos/core/use_case/use_case.dart';
import 'package:perros_sos/features/authentication/domain/repositories/auth_repository.dart';

class RegisterUserUseCase
    implements
        UseCase<Either<Failure, ApiResponse<bool>>, RegisterUserUseCaseParams> {
  final AuthRepository authRepository;

  RegisterUserUseCase({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, ApiResponse<bool>>> call(
      {required RegisterUserUseCaseParams params}) {
    return authRepository.registerUser(params);
  }
}

class RegisterUserUseCaseParams {
  String username;
  String password;
  List<String> roles;

  RegisterUserUseCaseParams({
    required this.username,
    required this.password,
    required this.roles,
  });
}