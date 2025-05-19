import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/lost_pet.dart';
import '../../domain/usecases/create_lost_pet_report.dart';
import '../../domain/usecases/get_stray_dogs.dart';

part 'stray_dog_event.dart';
part 'stray_dog_state.dart';

class StrayDogBloc extends Bloc<StrayDogEvent, StrayDogState> {
  final GetLostPetsUseCase getLostPetsUseCase;
  final CreateLostPetReportUseCase createLostPetReportUseCase;

  StrayDogBloc(
    this.getLostPetsUseCase,
    this.createLostPetReportUseCase,
  ) : super(StrayDogInitial()) {
    on<StrayDogEvent>((event, emit) {});
    on<GotAllLostPets>(_getAllStrayDogs);
    on<ReportNewLostPet>(_createNewReport);
  }

  Future<void> _createNewReport(
      ReportNewLostPet event, Emitter<StrayDogState> emit) async {
    try {
      emit(
        CreatedStrayDogReportInProgress(),
      );

      final apiResponse = await createLostPetReportUseCase(params: event.dto);
      if (apiResponse.success) {
        emit(
          CreatedStrayDogReportSuccessful(),
        );
      } else {
        emit(
          CreatedStrayDogReportFailure(),
        );
      }
    } catch (e) {}
  }

  Future<void> _getAllStrayDogs(
      GotAllLostPets event, Emitter<StrayDogState> emit) async {
    try {
      emit(
        GotAllLostPetsInProgress(),
      );

      final apiResponse = await getLostPetsUseCase();
      if (apiResponse.success) {
        emit(
          GotAllLostPetsSuccess(lostPets: apiResponse.data!),
        );
      } else {
        emit(
          GotAllLostPetsFailure(
            error: apiResponse.statusMessage ?? "Error",
          ),
        );
      }
    } catch (e) {}
  }
}
