class UserModel {
  String username;
  String email;
  String password;
  String password2;
  String userType;
  String gender;
  String birthday;
  String phone;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.password2,
    required this.userType,
    required this.gender,
    required this.birthday,
    required this.phone,
  });
  // Khởi tạo đối tượng với dữ liệu mặc định
  factory UserModel.defaultData() {
    return UserModel(
      username: "DefaultUser",
      email: "default@example.com",
      password: "123456",
      password2: "123456",
      userType: "user",
      gender: "M",
      birthday: "2000-01-01",
      phone: "123456789",
    );
  }
  // Tạo một UserModel từ JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      password2: json['password2'],
      userType: json['user_type'],
      gender: json['gender'],
      birthday: json['birthday'],
      phone: json['phone'],
    );
  }

  // Chuyển đổi UserModel thành JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'password2': password2,
      'user_type': userType,
      'gender': gender,
      'birthday': birthday,
      'phone': phone,
    };
  }
}
