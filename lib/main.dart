import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

import 'config/observer/app_bloc_observer.dart';
import 'config/routes/routes.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/stray_dog/presentation/bloc/stray_dog_bloc.dart';
import 'features/user_preferences/presentation/bloc/user_preferences_bloc.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpoverrides();
  ByteData data = await PlatformAssetBundle().load(
    'assets/ca/lets-encrypt-r3.pem',
  );
  SecurityContext.defaultContext.setTrustedCertificatesBytes(
    data.buffer.asUint8List(),
  );
  //Carga de archivo .env
  await dotenv.load();
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
  // await Firebase.initializeApp(
  //   name: "perros-sos",
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

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
          create: (context) => AuthenticationBloc(sl(), sl()),
        ),
        BlocProvider<StrayDogBloc>(
          create: (context) => StrayDogBloc(sl(), sl()),
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
          scaffoldBackgroundColor: Colors.grey.shade100,
        ),
        routerConfig: Routes.getroutes,
      ),
    );
  }
}

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
