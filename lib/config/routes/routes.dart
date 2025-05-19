import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/authentication/presentation/pages/register_page.dart';
import '../../features/stray_dog/presentation/pages/landing/landing_page.dart';
import '../../features/stray_dog/presentation/pages/new_lost_pet/new_lost_pet.dart';

enum Routes {
  login(
    name: "login",
    path: "/login",
    icon: Icon(Icons.person),
    screenWidget: LoginPage(),
  ),
  register(
    name: "register",
    path: "/register",
    icon: Icon(Icons.person_add_alt_1_rounded),
    screenWidget: RegisterPage(),
  ),
  //NavigationRoute
  landingLostPets(
    name: "landing",
    path: "/",
    icon: Icon(Icons.pets),
    screenWidget: LandingPage(),
  ),
  mapLostPets(
    name: "mapRoute",
    path: "/map",
    icon: Icon(Icons.map),
    screenWidget: RegisterPage(),
  ),
  userSettings(
    name: "UserSettingsRoute",
    path: "/user",
    icon: Icon(Icons.person),
    screenWidget: RegisterPage(),
  ),
  map(
    name: "map",
    path: "/map",
    icon: Icon(Icons.map),
    screenWidget: RegisterPage(),
  ),
  newLostPet(
    name: "newLostPet",
    path: "/newLostPet",
    icon: Icon(Icons.add),
    screenWidget: NewLostPet(),
  );

  static GoRouter get getroutes {
    return GoRouter(
      initialLocation: "/",
      routes: Routes.values
          .map((route) => GoRoute(
                path: route.path,
                name: route.name,
                builder: (context, state) => route.screenWidget,
              ))
          .toList(),
    );
  }

  //Items de la barra de navegación.
  static List<BottomNavigationBarItem> get bottomBarItems {
    return [
      BottomNavigationBarItem(
        label: Routes.landingLostPets.name.tr(),
        icon: Routes.landingLostPets.icon,
      ),
      BottomNavigationBarItem(
        label: Routes.mapLostPets.name.tr(),
        icon: Routes.mapLostPets.icon,
      ),
      BottomNavigationBarItem(
        label: Routes.userSettings.name.tr(),
        icon: Routes.userSettings.icon,
      ),
    ];
  }

  const Routes(
      {required this.name,
      required this.path,
      required this.icon,
      required this.screenWidget});
  final String name;
  final Icon icon;
  final String path;
  final Widget screenWidget;
}
