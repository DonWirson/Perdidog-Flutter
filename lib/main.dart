import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

import 'config/observer/app_bloc_observer.dart';
import 'config/routes/routes.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/stray_dog/domain/usecases/get_stray_dogs.dart';
import 'features/stray_dog/presentation/bloc/stray_dog_bloc.dart';
import 'features/user_preferences/presentation/bloc/user_preferences_bloc.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

Future<void> main() async {
  //Carga de archivo .env
  await dotenv.load(fileName: ".env");
  //Inicia get-it
  await initializeDependencies();
  //Bloc observer
  Bloc.observer = AppBlocObserver();
  //Config de diccionario
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //Confi de GoRouter
  GoRouter.optionURLReflectsImperativeAPIs = true;
  //Config de firebase
  await Firebase.initializeApp(
    name: "perros-sos",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'CL')],
      path: 'assets/localization',
      fallbackLocale: const Locale('es', 'CL'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            sl(),
            sl(),
          ),
        ),
        BlocProvider<StrayDogBloc>(
          create: (context) => StrayDogBloc(
            sl.get<GetLostPetsUseCase>(),
          ),
        ),
        BlocProvider<UserPreferencesBloc>(
          create: (context) => UserPreferencesBloc(),
        ),
      ],
      child: MaterialApp.router(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.grey.shade100),
        routerConfig: Routes.getroutes,
      ),
    );
  }
}
