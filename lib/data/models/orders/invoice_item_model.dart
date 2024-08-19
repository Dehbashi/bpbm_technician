class InvoiceItemModel {
  final int id;
  final int invoiceId;
  final String title;
  final String type;
  final int number;
  final String price;
  final int discount;
  final int purchasePrice;
  final String? serviceType;
  final String? shopType;
  final String? productName;
  final int subsidiary;
  final String unit;
  final String text;
  final int userId;
  final String? financialType;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const InvoiceItemModel({
    required this.id,
    required this.invoiceId,
    required this.title,
    required this.type,
    required this.number,
    required this.price,
    required this.discount,
    required this.purchasePrice,
    required this.serviceType,
    required this.shopType,
    required this.productName,
    required this.subsidiary,
    required this.unit,
    required this.text,
    required this.userId,
    required this.financialType,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  InvoiceItemModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        invoiceId = json['factor_id'],
        title = json['title'],
        type = json['type'],
        number = json['number'],
        price = json['price'],
        discount = json['discount'],
        purchasePrice = json['price_purchase'],
        serviceType = json['type_service'],
        shopType = json['type_shop'],
        productName = json['product_name'],
        subsidiary = json['subsidiary'],
        unit = json['unit'],
        text = json['text'],
        userId = json['user_id'],
        financialType = json['typefinancial'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        deletedAt = json['deleted_at'];

  @override
  String toString() {
    return 'InvoiceItemModel(id: $id, invoiceId: $invoiceId, title: $title, type: $type, number: $number, price: $price, discount: $discount, purchasePrice: $purchasePrice, serviceType: $serviceType, shopType: $shopType, productName: $productName, subsidiary: $subsidiary, unit: $unit, text: $text, userId: $userId, financialType: $financialType, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(covariant InvoiceItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.invoiceId == invoiceId &&
        other.title == title &&
        other.type == type &&
        other.number == number &&
        other.price == price &&
        other.discount == discount &&
        other.purchasePrice == purchasePrice &&
        other.serviceType == serviceType &&
        other.shopType == shopType &&
        other.productName == productName &&
        other.subsidiary == subsidiary &&
        other.unit == unit &&
        other.text == text &&
        other.userId == userId &&
        other.financialType == financialType &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        invoiceId.hashCode ^
        title.hashCode ^
        type.hashCode ^
        number.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        purchasePrice.hashCode ^
        serviceType.hashCode ^
        shopType.hashCode ^
        productName.hashCode ^
        subsidiary.hashCode ^
        unit.hashCode ^
        text.hashCode ^
        userId.hashCode ^
        financialType.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode;
  }
}
