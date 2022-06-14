import '../../services/api_services.dart';
import '../models/api_model.dart';

class BinaryRepositories {
  Future<Binary> fetchTheBinary(int num) async {
    final result = await ApiProvider().getBinary(num);
    return Binary.fromJson(result);
  }
}
