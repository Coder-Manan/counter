import '../../services/api_services.dart';
import '../models/api_model.dart';

class BinaryRepositories {
  Future<String> fetchTheBinary(int num) async {
    final result = await ApiProvider().getBinary(num);
    //print(result);
    return Binary.fromJson(result.data).converted == null ? "Error in API Call, try again" : Binary.fromJson(result.data).converted!;
  }
}
