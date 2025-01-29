class AdminBankInfoModel {
  final String? id;
  final String? bankName;
  final String? branchName;
  final String? accountHolderName;
  final String? accountNumber;
  final String? routingNumber;
  final String? createdBy;
  final String? updatedBy;
  final String? deletedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  AdminBankInfoModel({
    this.id,
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

  factory AdminBankInfoModel.fromJson(Map<String, dynamic> json) {
    return AdminBankInfoModel(
      id: json['id'],
      bankName: json['bank_name'],
      branchName: json['branch_name'],
      accountHolderName: json['account_holder_name'],
      accountNumber: json['account_number'],
      routingNumber: json['routing_number'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      deletedBy: json['deleted_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
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