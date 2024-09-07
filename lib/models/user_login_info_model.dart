class UserLoginInfoModel{
  final String? userId;
  final String? username; 
  final String? email;
  final List<String?>? roles;
  final String? photo;
  final int? iat;
  final int? exp;
  UserLoginInfoModel({
    this.userId,
    this.username,
    this.email,
    this.roles,
    this.photo,
    this.iat,
    this.exp
  });
}