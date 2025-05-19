import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/api/api_client_interface.dart';
import 'core/api/dio_client.dart';
import 'features/authentication/data/datasources/auth_service.dart';
import 'features/authentication/data/repositories/auth_repository_impl.dart';
import 'features/authentication/domain/repositories/auth_repository.dart';
import 'features/authentication/domain/usecases/login_user.dart';
import 'features/authentication/domain/usecases/register_user.dart';
import 'features/stray_dog/data/datasources/remote/stray_dog_api_service.dart';
import 'features/stray_dog/data/repositories/stray_dog_repository_impl.dart';
import 'features/stray_dog/domain/repositories/stray_dog_repository.dart';
import 'features/stray_dog/domain/usecases/create_lost_pet_report.dart';
import 'features/stray_dog/domain/usecases/get_stray_dogs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<ApiClient>(DioClient());
  //Dio instance
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<StrayDogApiService>(
    StrayDogApiService(
      apiClient: sl(),
    ),
  );

  //Services
  sl.registerSingleton<AuthService>(
    AuthService(
      apiClient: sl(),
    ),
  );

  //Repository
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      sl(),
    ),
  );
  sl.registerSingleton<StrayDogRepository>(
    StrayDogRepositoryImpl(
      sl(),
    ),
  );
  //Use cases
  //AUTH
  sl.registerSingleton<RegisterUserUseCase>(
    RegisterUserUseCase(
      authRepository: sl(),
    ),
  );
  sl.registerSingleton<LoginUserUseCase>(
    LoginUserUseCase(
      authRepository: sl(),
    ),
  );
  //LOSTPET
  sl.registerSingleton<GetLostPetsUseCase>(
    GetLostPetsUseCase(
      sl(),
    ),
  );
  sl.registerSingleton<CreateLostPetReportUseCase>(
    CreateLostPetReportUseCase(
      sl(),
    ),
  );
}
