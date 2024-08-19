import 'package:flutter/foundation.dart';

import 'package:bpbm_technician/data/models/orders/invoice_item_model.dart';

class OrderDetailInvoiceModel {
  final int id;
  final String type;
  final String title;
  final String text;
  final String orderId;
  final String? paymentTerm;
  final String? numberBank;
  final String? description;
  final String? effectiveTo;
  final int tax;
  final int discount;
  final int status;
  final int versionStatus;
  final int flagResult;
  final int hoferStatus;
  final int payStatus;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<InvoiceItemModel> items;

  const OrderDetailInvoiceModel({
    required this.id,
    required this.type,
    required this.title,
    required this.text,
    required this.orderId,
    required this.paymentTerm,
    required this.numberBank,
    required this.description,
    required this.effectiveTo,
    required this.tax,
    required this.discount,
    required this.status,
    required this.versionStatus,
    required this.flagResult,
    required this.hoferStatus,
    required this.payStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.items,
  });

  OrderDetailInvoiceModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'],
        title = json['title'],
        text = json['text'],
        orderId = json['order_id'],
        paymentTerm = json['payment_term'],
        numberBank = json['numberbank'],
        description = json['description'],
        effectiveTo = json['effectiveto'],
        tax = json['tax'],
        discount = json['discount'],
        status = json['status'],
        versionStatus = json['version_status'],
        flagResult = json['flag_result'],
        hoferStatus = json['hoferstatus'],
        payStatus = json['pay_status'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        deletedAt = json['deleted_at'],
        items = (json['items'] as List<dynamic>).map((item) {
          return InvoiceItemModel.fromJson(item);
        }).toList();

  @override
  String toString() {
    return 'OrderDetailInvoiceModel(id: $id, type: $type, title: $title, text: $text, orderId: $orderId, paymentTerm: $paymentTerm, numberBank: $numberBank, description: $description, effectiveTo: $effectiveTo, tax: $tax, discount: $discount, status: $status, versionStatus: $versionStatus, flagResult: $flagResult, hoferStatus: $hoferStatus, payStatus: $payStatus, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, items: $items)';
  }

  @override
  bool operator ==(covariant OrderDetailInvoiceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.title == title &&
        other.text == text &&
        other.orderId == orderId &&
        other.paymentTerm == paymentTerm &&
        other.numberBank == numberBank &&
        other.description == description &&
        other.effectiveTo == effectiveTo &&
        other.tax == tax &&
        other.discount == discount &&
        other.status == status &&
        other.versionStatus == versionStatus &&
        other.flagResult == flagResult &&
        other.hoferStatus == hoferStatus &&
        other.payStatus == payStatus &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        title.hashCode ^
        text.hashCode ^
        orderId.hashCode ^
        paymentTerm.hashCode ^
        numberBank.hashCode ^
        description.hashCode ^
        effectiveTo.hashCode ^
        tax.hashCode ^
        discount.hashCode ^
        status.hashCode ^
        versionStatus.hashCode ^
        flagResult.hashCode ^
        hoferStatus.hashCode ^
        payStatus.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        items.hashCode;
  }
}
