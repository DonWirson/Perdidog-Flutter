// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenderModel _$GenderModelFromJson(Map<String, dynamic> json) => GenderModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenderModelToJson(GenderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
