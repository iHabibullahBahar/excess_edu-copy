import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();
  static final SharedPref instance = SharedPref._();
  SharedPreferences? _sharedPreferences;
  Future<SharedPreferences> get prefs async {
    if (_sharedPreferences != null) {
      return _sharedPreferences!;
    }
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  static const String email = 'email';
  static const String phone = 'phone';
}
