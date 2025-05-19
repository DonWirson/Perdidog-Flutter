import '../../../../core/data_state/data_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/lost_pet_entities.dart';
import '../repositories/stray_dog_repository.dart';

class GetLostPetsUseCase implements UseCase<ApiResponse<List<LostPet>>, void> {
  final StrayDogRepository strayDogRepository;

  GetLostPetsUseCase(this.strayDogRepository);

  @override
  Future<ApiResponse<List<LostPet>>> call({void params}) {
    return strayDogRepository.getAllStrayDogs();
  }
}
