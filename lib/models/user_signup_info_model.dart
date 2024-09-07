class UserSignupInfoModel {
  final String? fullname;
  final String? email; 
  final String? password;
  final String? nid;
  final String? nidImage;
  final String? gender; 
  final DateTime? dob;
  final String? phone;
  final String? address;
  final String? photo; 
  final String? role;
  final String? createdBy;
  final String? updatedBy;
  final String? deletedBy; 
  final String? id;
  final DateTime? registeredAt;
  final bool? isActive; 
  final bool isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  UserSignupInfoModel({
    this.fullname,
    this.email,
    this.password,
    this.nid,
    this.nidImage,
    this.gender,
    this.dob,
    this.phone,
    this.address,
    this.photo,
    this.role,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.id,
    this.registeredAt,
    this.isActive,
    required this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory constructor to convert JSON to UserSignupInfoModel
  factory UserSignupInfoModel.fromJson(Map<String, dynamic> json) {
    return UserSignupInfoModel(
      fullname: json['fullname'],
      email: json['email'],
      password: json['password'],
      nid: json['nid'],
      nidImage: json['nid_image'],
      gender: json['gender'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      phone: json['phone'],
      address: json['address'],
      photo: json['photo'],
      role: json['role'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      deletedBy: json['deleted_by'],
      id: json['id'],
      registeredAt: json['registered_at'] != null ? DateTime.parse(json['registered_at']) : null,
      isActive: json['is_active'],
      isVerified: json['is_verified'] ?? false,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }
}