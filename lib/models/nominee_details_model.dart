class NomineeDetailsModel {
  String? id;
  String? userId;
  String? fullName;
  String? relation;
  String? nid;
  String? nidImage;
  String? email;
  String? dob;
  String? phone;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  NomineeDetailsModel({
    this.id,
    this.userId,
    this.fullName,
    this.relation,
    this.nid,
    this.nidImage,
    this.email,
    this.dob,
    this.phone,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory NomineeDetailsModel.fromJson(Map<String, dynamic> json) {
    return NomineeDetailsModel(
      id: json['id'],
      userId: json['user_id'],
      fullName: json['fullname'],
      relation: json['relation'],
      nid: json['nid'],
      nidImage: json['nid_image'],
      email: json['email'],
      dob: json['dob'],
      phone: json['phone'],
      address: json['address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'fullname': fullName,
      'relation': relation,
      'nid': nid,
      'nid_image': nidImage,
      'email': email,
      'dob': dob,
      'phone': phone,
      'address': address,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}