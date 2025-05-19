// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:perros_sos/features/stray_dog/data/model/stray_dog_models.dart';
import 'package:perros_sos/features/stray_dog/domain/entities/lost_pet_entities.dart';

part 'lost_pet_model.g.dart';

@JsonSerializable()
class LostPetModel extends LostPet {
  @override
  final AnimalTypeModel animalType;
  @override
  final GenderModel gender;

  LostPetModel({
    required super.id,
    required super.name,
    required super.reportDate,
    required super.isActive,
    required super.description,
    required super.imageUrl,
    required super.distinctFeature,
    required super.phoneNumberInscribed,
    required super.animalTypeId,
    required super.genderId,
    required this.animalType,
    required this.gender,
  }) : super(
          animalType: animalType,
          gender: gender,
        );

  factory LostPetModel.fromJson(Map<String, dynamic> json) =>
      _$LostPetModelFromJson(json);

  /// Connect the generated [_$LostPetModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LostPetModelToJson(this);
}
