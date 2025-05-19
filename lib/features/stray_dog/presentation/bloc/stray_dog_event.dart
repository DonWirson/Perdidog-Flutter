part of 'stray_dog_bloc.dart';

abstract class StrayDogEvent extends Equatable {
  const StrayDogEvent();

  @override
  List<Object> get props => [];
}

final class GotAllLostPets extends StrayDogEvent {}

final class ReportNewLostPet extends StrayDogEvent {
  final NewLostPetReportDto dto;

  const ReportNewLostPet({
    required this.dto,
  });
  @override
  List<Object> get props => [dto];
}
