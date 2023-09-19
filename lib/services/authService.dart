import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  static init() async {
    _prefs = await SharedPreferences.getInstance();
}
  static late final SharedPreferences _prefs;

  void loginUser(String userName) {
    try {
      _prefs.setString('userName', userName);
    } catch (e) {
      print(e);
    }
  }

  void logoutUser() {
    _prefs.clear();
  }

  String? getUser()  {
    // SharedPreferences prefs = await _prefs;
    return _prefs.getString('userName') ?? 'Unknown User';
  }
}