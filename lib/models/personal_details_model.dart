import 'dart:io';

class PersonalDetailsModel {
  String? id;
  File? image;
  String? fullName;
  String? email;
  String? nidNumber;
  File? nidFrontSideImage;
  File? nidBackSideImage;
  String? gender;
  DateTime? dateOfBirth;
  String? phoneNumber;
  String? address;

  PersonalDetailsModel({
    this.id,
    this.image,
    this.fullName,
    this.email,
    this.nidNumber,
    this.nidFrontSideImage,
    this.nidBackSideImage,
    this.gender,
    this.dateOfBirth,
    this.phoneNumber,
    this.address,
  });
}