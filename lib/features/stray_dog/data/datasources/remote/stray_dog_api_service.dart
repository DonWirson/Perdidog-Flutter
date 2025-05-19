import '../../../../../core/api/api_client_interface.dart';
import '../../../../../core/data_state/data_state.dart';
import '../../../../../core/enum/method_type_enum.dart';
import '../../../domain/usecases/create_lost_pet_report.dart';
import '../../model/stray_dog_models.dart';

class StrayDogApiService {
  final ApiClient apiClient;

  StrayDogApiService({
    required this.apiClient,
  });

  final endpointUrl = '/lost-pet';

  Future<ApiResponse<List<LostPetModel>>> getAllStrayDogs() async {
    final response = await apiClient.request<List<LostPetModel>, List>(
        path: endpointUrl,
        method: MethodType.get,
        fromJson: (json) {
          List<LostPetModel> lostPets = [];
          for (var element in json) {
            lostPets.add(LostPetModel.fromJson(element));
          }

          return lostPets;
        });

    return response;
  }

  Future<ApiResponse<LostPetModel>> createNewLostPetReport(
      NewLostPetReportDto dto) async {
    Map<String, dynamic> headers = dto.toMap();
    final response =
        await apiClient.request<LostPetModel, Map<String, dynamic>>(
            path: endpointUrl,
            method: MethodType.post,
            payload: headers,
            fromJson: (json) {
              print(json);
              var newLostPet = LostPetModel.fromJson(json);
              return newLostPet;
            });
    return response;
  }
}
