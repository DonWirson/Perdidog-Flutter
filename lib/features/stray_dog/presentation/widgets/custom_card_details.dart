import 'package:flutter/material.dart';

import '../../../../core/utils/time_utils.dart';
import '../../domain/entities/lost_pet_entities.dart';
import 'rounded_card_tile.dart';

class CustomCardDetails extends StatelessWidget {
  final LostPet lostPet;

  const CustomCardDetails({
    required this.lostPet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var day = TimeUtils.getDayOfTheWeek(lostPet.reportDate);
    var hour = TimeUtils.substractHour(lostPet.reportDate.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lostPet.name.isEmpty ? "N/A" : lostPet.name,
        ),
        actions: const [
          Icon(
            Icons.star_rate_rounded,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 10,
        ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: lostPet.imageUrl == null
                    ? Image.asset(
                        "assets/images/cute_dog.jpg",
                        fit: BoxFit.scaleDown,
                      )
                    : Image.network(
                        lostPet.imageUrl!,
                        fit: BoxFit.scaleDown,
                      ),
              ),
              const Spacer(),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedCardTile(
                      title: "Nombre Reportado:",
                      subTitle: lostPet.name.isEmpty ? "N/A" : lostPet.name,
                      tileColor: Colors.lightBlue.shade50,
                      onTap: null,
                    ),
                    RoundedCardTile(
                      title: "Dia/hora reportado:",
                      subTitle: "$day $hour",
                      tileColor: Colors.amber.shade50,
                      onTap: null,
                    ),
                    RoundedCardTile(
                      title: "Descripción",
                      subTitle:
                          lostPet.description ?? "Descripcion no entregada",
                      tileColor: Colors.blueGrey.shade50,
                      onTap: () {
                        print(lostPet.description ?? "ATAAAAAAAAAAAAAATA");
                      },
                    ),
                    RoundedCardTile(
                      title: "Numero de telefono:",
                      subTitle: lostPet.phoneNumberInscribed.toString(),
                      tileColor: Colors.lightGreen.shade50,
                      onTap: null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
