class MyInfoResponseModel {
  final String id;
  final String password;
  final DateTime? lastLogin;
  final bool isSuperuser;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final bool isStaff;
  final bool isActive;
  final DateTime dateJoined;
  final String phone;
  final String avatar;
  final String gender;
  final DateTime birthday;
  final List<dynamic> groups;
  final List<dynamic> userPermissions;

  MyInfoResponseModel({
    required this.id,
    required this.password,
    this.lastLogin,
    this.isSuperuser = false,
    required this.username,
    this.firstName = '',
    this.lastName = '',
    required this.email,
    this.isStaff = false,
    this.isActive = true,
    required this.dateJoined,
    this.phone = '',
    this.avatar = 'https://phuongming-linh-my-app.s3.amazonaws.com/default_avatar.png',
    this.gender = 'M',
    required this.birthday,
    this.groups = const [],
    this.userPermissions = const [],
  });

  // JSON serialization methods
  factory MyInfoResponseModel.fromJson(Map<String, dynamic> json) {
    return MyInfoResponseModel(
      id: json['id'] ?? '',
      password: json['password'] ?? '',
      lastLogin: json['last_login'] != null ? DateTime.parse(json['last_login']) : null,
      isSuperuser: json['is_superuser'] ?? false,
      username: json['username'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      isStaff: json['is_staff'] ?? false,
      isActive: json['is_active'] ?? true,
      dateJoined: DateTime.parse(json['date_joined'] ?? DateTime.now().toIso8601String()),
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? 'https://phuongming-linh-my-app.s3.amazonaws.com/default_avatar.png',
      gender: json['gender'] ?? 'M',
      birthday: DateTime.parse(json['birthday'] ?? DateTime.now().toIso8601String()),
      groups: List<dynamic>.from(json['groups'] ?? []),
      userPermissions: List<dynamic>.from(json['user_permissions'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'last_login': lastLogin?.toIso8601String(),
      'is_superuser': isSuperuser,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'is_staff': isStaff,
      'is_active': isActive,
      'date_joined': dateJoined.toIso8601String(),
      'phone': phone,
      'avatar': avatar,
      'gender': gender,
      'birthday': birthday.toIso8601String(),
      'groups': groups,
      'user_permissions': userPermissions,
    };
  }
}
