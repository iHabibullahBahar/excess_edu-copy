import 'package:shared_preferences/shared_preferences.dart';

import '../user_pref/shared_pref.dart' show SharedPref;

class ConstFunctions {
  static void setUserData(String? email, String? phone) async {
    if (email != null) {
      SharedPref.instance.prefs
          .then((value) => value.setString(SharedPref.email, email));
    } else {
      SharedPref.instance.prefs
          .then((value) => value.setString(SharedPref.email, ''));
    }
    if (phone != null) {
      SharedPref.instance.prefs
          .then((value) => value.setString(SharedPref.phone, phone));
    } else {
      SharedPref.instance.prefs
          .then((value) => value.setString(SharedPref.phone, ''));
    }
  }
}
