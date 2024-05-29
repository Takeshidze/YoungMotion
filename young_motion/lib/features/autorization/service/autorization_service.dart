import 'package:shared_preferences/shared_preferences.dart';
import 'package:young_motion/core/models/user.dart';

class AuthenticationService {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  AuthenticationService() {
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }
  }

  void login() {
    // Добавьте здесь логику для проверки авторизации пользователя
    _isLoggedIn = true;
    saveLoginStatus(true);
  }

  void logout() {
    _isLoggedIn = false;
    saveLoginStatus(false);
  }

  void register() {
    // Добавьте здесь логику для отправки запроса на регистрацию пользователя
  }

  void saveLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }
}
