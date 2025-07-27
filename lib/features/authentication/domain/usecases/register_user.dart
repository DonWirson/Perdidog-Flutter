// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:perdidog/core/data_state/data_state.dart';
import 'package:perdidog/core/data_state/failure.dart';
import 'package:perdidog/core/use_case/use_case.dart';
import 'package:perdidog/features/authentication/domain/repositories/auth_repository.dart';

class RegisterUserUseCase
    implements UseCase<Either<Failure, ApiResponse<bool>>, RegisterRequestDto> {
  final AuthRepository authRepository;

  RegisterUserUseCase({required this.authRepository});

  @override
  Future<Either<Failure, ApiResponse<bool>>> call({
    required RegisterRequestDto params,
  }) {
    return authRepository.registerUser(params);
  }
}

class RegisterRequestDto {
  String username;
  String password;
  List<String> roles;

  RegisterRequestDto({
    required this.username,
    required this.password,
    required this.roles,
  });
}
