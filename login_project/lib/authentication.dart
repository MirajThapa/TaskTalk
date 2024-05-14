import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  static Future<bool> authenticateUser(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');
    return storedUsername == username && storedPassword == password;
  }

  static Future<void> registerUser(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }
}