class UserResponse {
  String id;
  String username;
  String email;
  String userType;
  String gender;
  String birthday;
  String phone;
  String avatar;

  UserResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.userType,
    required this.gender,
    required this.birthday,
    required this.phone,
    required this.avatar,
  });

  // Tạo một UserModel từ JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      userType: json['user_type'],
      gender: json['gender'],
      birthday: json['birthday'],
      phone: json['phone'],
      avatar: json['avatar'],
    );
  }

  // Chuyển đổi UserModel thành JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'user_type': userType,
      'gender': gender,
      'birthday': birthday,
      'phone': phone,
      'avatar': avatar,
    };
  }

  // Tạo dữ liệu mặc định cho UserModel
  factory UserResponse.defaultUser() {
    return UserResponse(
      id: 'default_id',
      username: 'DefaultUser',
      email: 'default@example.com',
      userType: 'user',
      gender: 'M',
      birthday: '2000-01-01',
      phone: '0000000000',
      avatar: 'http://api-luan-v1.onrender.com/media/default_avatar.png',
    );
  }
}
