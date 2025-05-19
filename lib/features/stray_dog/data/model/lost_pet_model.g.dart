// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lost_pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LostPetModel _$LostPetModelFromJson(Map<String, dynamic> json) => LostPetModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      reportDate: DateTime.parse(json['reportDate'] as String),
      isActive: json['isActive'] as bool,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      distinctFeature: json['distinctFeature'] as String?,
      phoneNumberInscribed: (json['phoneNumberInscribed'] as num?)?.toInt(),
      animalTypeId: (json['animalTypeId'] as num).toInt(),
      genderId: (json['genderId'] as num).toInt(),
      animalType:
          AnimalTypeModel.fromJson(json['animalType'] as Map<String, dynamic>),
      gender: GenderModel.fromJson(json['gender'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LostPetModelToJson(LostPetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'reportDate': instance.reportDate.toIso8601String(),
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'distinctFeature': instance.distinctFeature,
      'phoneNumberInscribed': instance.phoneNumberInscribed,
      'isActive': instance.isActive,
      'animalTypeId': instance.animalTypeId,
      'genderId': instance.genderId,
      'animalType': instance.animalType,
      'gender': instance.gender,
    };
