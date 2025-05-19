import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/gradients/gradients.dart';
import '../../../../../core/utils/loading_progress_indicator.dart';
import '../../../../authentication/presentation/bloc/authentication_bloc.dart';
import '../../../../user_preferences/presentation/bloc/user_preferences_bloc.dart';
import '../../bloc/stray_dog_bloc.dart';
import '../stray_dog/landing_stray_dog_page.dart';
import 'map_page.dart';
import 'settings_page.dart';

class LandingPage extends StatefulWidget {
  final String? title;
  final bool showBottomBar;
  final bool showAppBar;

  const LandingPage({
    this.title,
    this.showAppBar = true,
    this.showBottomBar = false,
    super.key,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    BlocProvider.of<AuthenticationBloc>(context).add(
      CheckedLoggedIn(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<UserPreferencesBloc>(context);

    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is IsNotLoggedIn) {
          context.pushReplacementNamed("login");
        }

        if (state is IsLoggedIn) {
          //Disparar eventos para buscar perritos o mascotas :D
          BlocProvider.of<StrayDogBloc>(context).add(
            GotAllLostPets(),
          );
        }
      },
      builder: (context, state) {
        if (state is CheckedLoggedInProgress || state is IsNotLoggedIn) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: Gradients.loadingGradient(),
            ),
            child: const LoadingProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title ?? "Landing"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: Routes.bottomBarItems,
            currentIndex: bloc.currentIndex,
            selectedItemColor: const Color.fromARGB(158, 255, 145, 0),
            onTap: (currentIndex) {
              setState(
                () {
                  bloc.currentIndex = currentIndex;
                },
              );
            },
          ),
          body: IndexedStack(
            index: bloc.currentIndex,
            children: const [
              LandingStrayDog(),
              LandingMap(),
              Landingsettings(),
            ],
          ),
          floatingActionButton: ElevatedButton(
            child: const Icon(Icons.add),
            onPressed: () => navigateToNewLostPet(),
          ),
        );
      },
    );
  }

  void navigateToNewLostPet() {
    context.pushNamed("newLostPet");
  }
}
