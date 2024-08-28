import 'dart:io';

class NomineeDetailsModel {
  String? id;
  String? fullName;
  String? relationship;
  String? email;
  String? nidNumber;
  File? nidFrontSideImage;
  File? nidBackSideImage;
  String? gender;
  DateTime? dateOfBirth;
  String? phoneNumber;
  String? address;

  NomineeDetailsModel({
    this.id,
    this.fullName,
    this.relationship,
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