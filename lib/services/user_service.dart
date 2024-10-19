// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../constants/app_constants.dart';

class UserService {
  // AppUser? tempUser;
  // AppUser? user;

  // void setTempUser(Map<String, dynamic>? data) {
  //   if (data != null) {
  //     tempUser = AppUser.fromJson(data);
  //   }
  // }

  // Future<void> saveLoginCredential(Map<String, dynamic>? data) async {
  //   if (data == null) return;

  //   user = AppUser.fromJson(data);
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString(Prefs.user, jsonEncode(user!.toJson()));
  // }

  // Future<AppUser?> loadCredential() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? value = prefs.getString(Prefs.user);
  //   if (value != null) {
  //     user = AppUser.fromJson(jsonDecode(value));
  //   } else {
  //     user = null;
  //   }
  //   return user;
  // }

  // Future<void> logout() async {
  //   tempUser = user = null;
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  //   navigationService.pushNamedAndRemoveUntil(
  //     Routes.loginView,
  //     predicate: (route) => false,
  //   );
  // }
}
