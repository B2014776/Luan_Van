import 'package:agri_shop/core/configs/enum.dart';
import 'package:agri_shop/core/data/dto/response/my_info_response_model.dart';
import 'package:agri_shop/core/data/prefs/Prefs.dart';
import 'package:agri_shop/core/data/service/apis/user_service.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final isLoading = false.obs;
  final avatar = ''.obs;
  final name = ''.obs;
  final selectedValue = "M".obs;
  final phone = ''.obs;
  final email = ''.obs;
  final birthday = ''.obs;
  final location = ''.obs;

  final UserService userService = UserService();
  final Prefs prefs = Prefs();
  final myInfoResponseModel = Rx<MyInfoResponseModel>(
    MyInfoResponseModel(
      id: 'default-id',
      password: 'default-password',
      lastLogin: DateTime.now().subtract(const Duration(days: 7)),
      isSuperuser: false,
      username: 'default_username',
      firstName: 'Default',
      lastName: 'User',
      email: 'default@example.com',
      isStaff: false,
      isActive: true,
      dateJoined: DateTime.now().subtract(const Duration(days: 365)),
      phone: '1234567890',
      avatar:
          'https://phuongming-linh-my-app.s3.amazonaws.com/default_avatar.png',
      gender: 'M',
      birthday: DateTime(2000, 1, 1),
      groups: [],
      userPermissions: [],
    ),
  );

  Map<String, dynamic>? profileValue;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadInitialData();
  }

  Future<void> loadInitialData() async {
    isLoading.value = true;
    try {
      final response = await userService.myProfile();
      if (response.status == Status.success && response.data != null) {
        myInfoResponseModel.value = response.data!;
      } else {
        print("Failed to fetch profile data or data is null.");
      }
    } catch (e) {
      print("Error loading profile: $e");
    } finally {
      isLoading.value = false;
      update(["updateForm"]);
    }
  }

  Future<void> handleSubmit() async {
    print("Name: ${name.value}");
    print("Phone (from model): ${myInfoResponseModel.value.phone}");
    print("Phone (input): ${phone.value}");
    print("Birthday: ${birthday.value}");
    print("Location: ${location.value}");
  }
}
