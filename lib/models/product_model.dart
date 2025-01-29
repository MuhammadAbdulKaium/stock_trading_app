class ProductModel {
  String? id;
  String? name;
  String? regionOfOrigin;
  double? lotSize;
  String? lotUnit;
  double? pricePerUnit;
  String? storageCondition;
  String? precaution;
  String? imageUrl;
  double? transportCost;
  double? handlingCost;
  double? additionalCost;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Warehouse? warehouse;
  Category? category;
  User? createdBy;
  User? updatedBy;

  ProductModel({
    this.id,
    this.name,
    this.regionOfOrigin,
    this.lotSize,
    this.lotUnit,
    this.pricePerUnit,
    this.storageCondition,
    this.precaution,
    this.imageUrl,
    this.transportCost,
    this.handlingCost,
    this.additionalCost,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.warehouse,
    this.category,
    this.createdBy,
    this.updatedBy,
  });

  // Factory method to create a ProductModel from a JSON object
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      regionOfOrigin: json['region_of_origin'],
      lotSize: (json['lot_size'] as num?)?.toDouble(),
      lotUnit: json['lot_unit'],
      pricePerUnit: (json['price_per_unit'] as num?)?.toDouble(),
      storageCondition: json['storage_condition'],
      precaution: json['precaution'],
      imageUrl: json['image'],
      transportCost: (json['transport_cost'] as num?)?.toDouble(),
      handlingCost: (json['handling_cost'] as num?)?.toDouble(),
      additionalCost: (json['additional_cost'] as num?)?.toDouble(),
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      warehouse: json['warehouse'] != null ? Warehouse.fromJson(json['warehouse']) : null,
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      createdBy: json['created_by'] != null ? User.fromJson(json['created_by']) : null,
      updatedBy: json['updated_by'] != null ? User.fromJson(json['updated_by']) : null,
    );
  }

  // Method to convert a ProductModel to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'region_of_origin': regionOfOrigin,
      'lot_size': lotSize,
      'lot_unit': lotUnit,
      'price_per_unit': pricePerUnit,
      'storage_condition': storageCondition,
      'precaution': precaution,
      'image': imageUrl,
      'transport_cost': transportCost,
      'handling_cost': handlingCost,
      'additional_cost': additionalCost,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'warehouse': warehouse?.toJson(),
      'category': category?.toJson(),
      'created_by': createdBy?.toJson(),
      'updated_by': updatedBy?.toJson(),
    };
  }
}

class Warehouse {
  String? warehouseId;
  String? warehouseName;
  String? location;
  String? type;
  double? monthlyStorageCost;

  Warehouse({
    this.warehouseId,
    this.warehouseName,
    this.location,
    this.type,
    this.monthlyStorageCost,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(
      warehouseId: json['id'],
      warehouseName: json['name'],
      location: json['location'],
      type: json['type'],
      monthlyStorageCost: (json['month_store_cost'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': warehouseId,
      'name': warehouseName,
      'location': location,
      'type': type,
      'month_store_cost': monthlyStorageCost,
    };
  }
}

class Category {
  String? categoryId;
  String? categoryName;

  Category({this.categoryId, this.categoryName});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['id'],
      categoryName: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': categoryId,
      'name': categoryName,
    };
  }
}

class User {
  String? userId;
  String? userName;
  String? email;
  String? photo;

  User({this.userId, this.userName, this.email, this.photo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      userName: json['name'],
      email: json['email'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'name': userName,
      'email': email,
      'photo': photo,
    };
  }
}