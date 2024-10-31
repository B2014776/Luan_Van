import 'package:agri_shop/core/configs/prefs_contants.dart';
import 'package:agri_shop/core/data/prefs/Prefs.dart';

class AuthUseCase {
  static final Prefs prefs = Prefs();

  // Method to set the authentication token
  static Future<void> setAuthToken(String token) async {
    try {
      await prefs.set(PrefsConstants.token, token);
    } catch (e) {
      // Handle any errors if necessary
      print("Failed to set auth token: $e");
    }
  }

  // Method to retrieve the authentication token
  static Future<String> getAuthToken() async {
    try {
      var result = await prefs.get(PrefsConstants.token);
      return result;
    } catch (e) {
      return "";
    }
  }

  // Method to check if user is logged in
  static Future<bool> isLogin() async {
    try {
      final token = await getAuthToken();
      return token.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
