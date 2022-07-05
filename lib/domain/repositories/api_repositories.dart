import '../../services/api_services.dart';
import '../models/api_model.dart';

class BinaryRepositories {
  Future<Binary> fetchTheBinary(int num) async {
    final result = await ApiProvider().getBinary(num);
    //print(result);
    return Binary.fromJson(result.data);
  }
}
