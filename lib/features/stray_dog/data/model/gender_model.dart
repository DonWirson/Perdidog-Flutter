// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:perros_sos/features/stray_dog/domain/entities/lost_pet_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gender_model.g.dart';

@JsonSerializable()
class GenderModel extends Gender {
  GenderModel({
    required super.id,
    required super.name,
  });

  factory GenderModel.fromJson(Map<String, dynamic> json) =>
      _$GenderModelFromJson(json);

  /// Connect the generated [_$GenderModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GenderModelToJson(this);
}
