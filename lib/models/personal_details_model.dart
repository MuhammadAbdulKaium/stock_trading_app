class PersonalDetailsModel {
  String? id;
  String? fullName;
  String? email;
  String? password;
  String? nid;
  String? nidImage;
  String? gender;
  String? dob;
  String? phone;
  String? address;
  String? photo;
  String? registeredAt;
  String? role;
  bool? isActive;
  bool? isVerified;

  PersonalDetailsModel({
    this.id,
    this.fullName,
    this.email,
    this.password,
    this.nid,
    this.nidImage,
    this.gender,
    this.dob,
    this.phone,
    this.address,
    this.photo,
    this.registeredAt,
    this.role,
    this.isActive,
    this.isVerified,
  });

  factory PersonalDetailsModel.fromJson(Map<String, dynamic> json) {
    return PersonalDetailsModel(
      id: json['id'],
      fullName: json['fullname'],
      email: json['email'],
      password: json['password'],
      nid: json['nid'],
      nidImage: json['nid_image'],
      gender: json['gender'],
      dob: json['dob'],
      phone: json['phone'],
      address: json['address'],
      photo: json['photo'],
      registeredAt: json['registered_at'],
      role: json['role'],
      isActive: json['is_active'],
      isVerified: json['is_verified'],
    );
  }
}