class UserLoginInfoModel{
  final String? userId;
  final String? username; 
  final String? email;
  final List<String?>? roles;
  final String? photo;
  final bool isVerified;
  final int? iat;
  final int? exp;
  UserLoginInfoModel({
    this.userId,
    this.username,
    this.email,
    this.roles,
    this.photo,
    required this.isVerified,
    this.iat,
    this.exp
  });
}