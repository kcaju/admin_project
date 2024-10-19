import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;

import '../constants/app_strings.dart';

class ApiService {
  static const environment = ApiEnvironment.dev;

  static String baseUrl = environment.baseUrl;
  static String baseUrlApi = "$baseUrl/public/api";
  static String baseUrlImage = "$baseUrl/public/storage";

  // final _userService = locator<UserService>();
  // final _notificationService = locator<NotificationService>();

  var client = RetryClient(
    http.Client(),
    whenError: (onError, stackTrace) {
      if (onError.toString().contains(AppStrings.connectionClosedError)) {
        debugPrint("Retring....");
        return true;
      }
      return false;
    },
  );
  Duration timeoutDuration = const Duration(seconds: 20);
  Map<String, String> get userHeader {
    // if (user?.accessToken != null) {
    //   return {
    //     'Accept': 'application/json',
    //     'Authorization': 'Bearer ${user!.accessToken}',
    //     'Content-Type': 'application/json',
    //   };
    // }
    debugPrint('Token is null');
    return jsonHeader;
  }

  static const Map<String, String> jsonHeader = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  // Future<void> saveLoginCredential(AppUser appUser) async {
  // user = appUser;
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setBool(Prefs.isLoggedIn, true);
  // prefs.setString(Prefs.user, jsonEncode(user!.toJson()));
  // }

  // Future<AppUser?> loadCredential() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? value = prefs.getString(Prefs.user);
  //   if (value != null) {
  //     user = AppUser.fromJson(jsonDecode(value));
  //   } else {
  //     user = null;
  //   }
  //   return user;
  // }
}

enum ApiEnvironment {
  dev("https://example.com"),
  prod("https://prod.example.com");

  const ApiEnvironment(this.baseUrl);

  final String baseUrl;
}
