import 'package:shared_preferences/shared_preferences.dart';

class logOut {
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userLogin');
  }
}
