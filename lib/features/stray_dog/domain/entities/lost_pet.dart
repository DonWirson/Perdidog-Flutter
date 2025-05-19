import 'lost_pet_entities.dart';

class LostPet {
  int id;
  String name;
  DateTime reportDate;
  String? description;
  String? imageUrl;
  String? distinctFeature;
  int? phoneNumberInscribed;

  bool isActive;
  int animalTypeId;
  int genderId;
  AnimalType animalType;
  Gender gender;

  LostPet({
    required this.id,
    required this.name,
    required this.reportDate,
    required this.description,
    required this.imageUrl,
    required this.distinctFeature,
    required this.phoneNumberInscribed,
    required this.isActive,
    required this.animalTypeId,
    required this.genderId,
    required this.animalType,
    required this.gender,
  });
}
