class LoginResponseModel {
  final String refresh;
  final String access;

  LoginResponseModel({
    required this.refresh,
    required this.access,
  });

  // JSON serialization method
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      refresh: json['refresh'],
      access: json['access'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh': refresh,
      'access': access,
    };
  }
}
 