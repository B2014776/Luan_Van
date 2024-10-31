

// class UserUseCase {
  
//   Future<UserModel?> getUser() async {
//     try {
//       // Retrieve JSON string from Prefs
//       final String? tokenJson = await _prefs.get(PrefsConstants.user);

//       if (tokenJson == null || tokenJson.isEmpty) {
//         return null;
//       }
//       // Decode JSON string to Map
//       final Map<String, dynamic> userMap = jsonDecode(tokenJson);

//       // Convert Map to UserModel
//       return UserModel.fromJson(userMap);
//     } catch (e) {
//       // Handle any errors during decoding or mapping
//       print('Failed to get user: $e');
//       return null;
//     }
//   }
// }