import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/lost_pet_entities.dart';
import '../../bloc/stray_dog_bloc.dart';
import '../../widgets/custom_card.dart';

class LandingStrayDog extends StatefulWidget {
  const LandingStrayDog({
    // required this.lostPets,
    super.key,
  });

  @override
  State<LandingStrayDog> createState() => _LandingStrayDogState();
}

class _LandingStrayDogState extends State<LandingStrayDog> {
  List<LostPet> lostPets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StrayDogBloc, StrayDogState>(
      listener: (context, state) {
        if (state is GotAllLostPetsSuccess) {
          lostPets = state.lostPets +
              state.lostPets +
              state.lostPets +
              state.lostPets +
              state.lostPets +
              state.lostPets;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const Flexible(
              child: Padding(
                padding: EdgeInsets.all(
                  15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Filtro",
                    ),
                    Icon(
                      Icons.arrow_drop_down_circle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                ),
                itemCount: lostPets.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomCard(
                    context: context,
                    lostPet: lostPets[index],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  int getItemCountPerRow(BuildContext context) {
    double minTileWidth = 200;
    double availableWidth = MediaQuery.of(context).size.width;

    int i = availableWidth ~/ minTileWidth;
    return i;
  }
}
