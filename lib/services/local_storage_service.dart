import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late LocalStorageService _instance;
  static late SharedPreferences _preferences;

  static Future<LocalStorageService> getInstance() async {
    _instance = LocalStorageService();
    _preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  void setCounter(int counter){
    _preferences.setInt('counter', counter);
  }

  int getCounter(){
    int? counter = _preferences.getInt('counter');
    if (counter == null){
      setCounter(0);
      return 0;
    }
    return counter;
  }
}