part of 'stray_dog_bloc.dart';

abstract class StrayDogState extends Equatable {
  @override
  List<Object> get props => [];
}

final class StrayDogInitial extends StrayDogState {}

final class GotAllLostPetsInProgress extends StrayDogState {}

final class GotAllLostPetsSuccess extends StrayDogState {
  final List<LostPet> lostPets;

  GotAllLostPetsSuccess({
    required this.lostPets,
  });
  @override
  List<Object> get props => lostPets;
}

final class GotAllLostPetsFailure extends StrayDogState {
  final String error;

  GotAllLostPetsFailure({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}

//States CreatedStrayDogReport
final class CreatedStrayDogReportInProgress extends StrayDogState {}

final class CreatedStrayDogReportSuccessful extends StrayDogState {}

final class CreatedStrayDogReportFailure extends StrayDogState {}
