import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<dynamic> getBinary(int number) async {
    final url = "https://networkcalc.com/api/binary/$number?from=10&to=2";
    try {
      final response = await _dio.get(url);

      return response;
    } catch (e) {

    }
  }
}
