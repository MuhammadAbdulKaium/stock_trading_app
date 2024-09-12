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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullName,
      'email': email,
      'password': password,
      'nid': nid,
      'nid_image': nidImage,
      'gender': gender,
      'dob': dob,
      'phone': phone,
      'address': address,
      'photo': photo,
      'registered_at': registeredAt,
      'role': role,
      'is_active': isActive,
      'is_verified': isVerified,
    };
  }
}