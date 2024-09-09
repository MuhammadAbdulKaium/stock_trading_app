class BankDetailsModel {
  String? id;
  String? userId;
  String? bankName;
  String? branchName;
  String? accountHolderName;
  String? accountNumber;
  String? routingNumber;
  String? createdBy;
  String? updatedBy;
  String? deletedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  BankDetailsModel({
    this.id,
    this.userId,
    this.bankName,
    this.branchName,
    this.accountHolderName,
    this.accountNumber,
    this.routingNumber,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory BankDetailsModel.fromJson(Map<String, dynamic> json) {
    return BankDetailsModel(
      id: json['id'],
      userId: json['user_id'],
      bankName: json['bank_name'],
      branchName: json['branch_name'],
      accountHolderName: json['account_holder_name'],
      accountNumber: json['account_number'],
      routingNumber: json['routing_number'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      deletedBy: json['deleted_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'bank_name': bankName,
      'branch_name': branchName,
      'account_holder_name': accountHolderName,
      'account_number': accountNumber,
      'routing_number': routingNumber,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'deleted_by': deletedBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}