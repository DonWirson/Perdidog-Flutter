// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import '../../../../core/data_state/data_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/lost_pet_entities.dart';
import '../repositories/stray_dog_repository.dart';

class CreateLostPetReportUseCase
    implements UseCase<ApiResponse<LostPet>, NewLostPetReportDto> {
  final StrayDogRepository strayDogRepository;

  CreateLostPetReportUseCase(this.strayDogRepository);

  @override
  Future<ApiResponse<LostPet>> call({required NewLostPetReportDto params}) {
    return strayDogRepository.createNewLostPetReport(useCaseParams: params);
  }
}

class NewLostPetReportDto {
  String name;
  String reportDate;
  String? description;
  String? imageUrl;
  String? distinctFeature;
  int? phoneNumberInscribed;

  bool isActive;
  int animalTypeId;
  int genderId;

  NewLostPetReportDto({
    required this.name,
    required this.reportDate,
    required this.description,
    required this.imageUrl,
    required this.distinctFeature,
    required this.phoneNumberInscribed,
    required this.isActive,
    required this.animalTypeId,
    required this.genderId,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'reportDate': reportDate,
      'description': description,
      'imageUrl': imageUrl,
      'distinctFeature': distinctFeature,
      'phoneNumberInscribed': phoneNumberInscribed,
      'isActive': isActive,
      'animalTypeId': animalTypeId,
      'genderId': genderId,
    };
  }

  factory NewLostPetReportDto.fromMap(Map<String, dynamic> map) {
    return NewLostPetReportDto(
      name: map['name'] as String,
      reportDate: map['reportDate'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      distinctFeature: map['distinctFeature'] != null ? map['distinctFeature'] as String : null,
      phoneNumberInscribed: map['phoneNumberInscribed'] != null ? map['phoneNumberInscribed'] as int : null,
      isActive: map['isActive'] as bool,
      animalTypeId: map['animalTypeId'] as int,
      genderId: map['genderId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewLostPetReportDto.fromJson(String source) => NewLostPetReportDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
