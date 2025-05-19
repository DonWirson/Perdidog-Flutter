import '../../../../core/data_state/data_state.dart';
import '../entities/lost_pet_entities.dart';
import '../usecases/create_lost_pet_report.dart';

abstract class StrayDogRepository {
  Future<ApiResponse<List<LostPet>>> getAllStrayDogs();
  Future<ApiResponse<LostPet>> getOneStrayDog({required int id});
  Future<ApiResponse<LostPet>> createNewLostPetReport({
    required NewLostPetReportDto useCaseParams,
  });
}
