import 'package:shared_preferences/shared_preferences.dart';
import 'package:iss_task_app/features/auth/domain/entities/app_user.dart';

abstract class LocalAuthDataSource {
  Future<AppUser?> getUser();
  Future<bool> validateUser(String email, String password);
  Future<void> saveLogin();
}

class LocalAuthDataSourceImpl implements LocalAuthDataSource {
  final SharedPreferences sharedPrefs;

  static const _adminEmail = 'admin@iss-group.com';
  static const _adminPassword = '123456';
  static const _loginKey = 'isLoggedIn';

  LocalAuthDataSourceImpl({required this.sharedPrefs});

  @override
  Future<bool> validateUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final isValid = email == _adminEmail && password == _adminPassword;
    if (isValid) {
      await saveLogin();
    }
    return isValid;
  }

  @override
  Future<void> saveLogin() async {
    await sharedPrefs.setBool(_loginKey, true);
  }

  @override
  Future<AppUser?> getUser() async {
    return AppUser(id: '1', email: _adminEmail, name: 'Admin');
  }
}
