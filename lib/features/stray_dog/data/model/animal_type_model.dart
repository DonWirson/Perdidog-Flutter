// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:perros_sos/features/stray_dog/domain/entities/lost_pet_entities.dart';

part 'animal_type_model.g.dart';

@JsonSerializable()
class AnimalTypeModel extends AnimalType {
  AnimalTypeModel({
    required super.id,
    required super.name,
  });

  factory AnimalTypeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimalTypeModelFromJson(json);

  /// Connect the generated [_$AnimalTypeModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AnimalTypeModelToJson(this);
}
