import 'package:flutter/foundation.dart';

import 'package:bpbm_technician/data/models/orders/order_detail_invoice_model.dart';

class OrderDetails {
  final int id;
  final int orderDataId;
  final int serviceId;
  final int userId;
  final int priceServices;
  final String priceProduct;
  final String transportationCost;
  final int tax;
  final String discount;
  final String totalPrice;
  final int addressId;
  final String date;
  final String time;
  final String text;
  final int status;
  final int orderStatus;
  final int pull;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List items;
  final dynamic address;
  final dynamic service;
  final dynamic user;
  final String? notes;
  final OrderDetailInvoiceModel invoice;

  OrderDetails({
    required this.orderDataId,
    required this.serviceId,
    required this.tax,
    required this.discount,
    required this.addressId,
    required this.text,
    required this.pull,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.invoice,
    required this.id,
    required this.userId,
    required this.priceServices,
    required this.priceProduct,
    required this.transportationCost,
    required this.totalPrice,
    required this.date,
    required this.time,
    required this.status,
    required this.orderStatus,
    required this.items,
    required this.address,
    required this.service,
    required this.user,
    required this.notes,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      id: json["id"],
      userId: json["user_id"],
      priceServices: json["price_services"],
      priceProduct: json["price_products"],
      transportationCost: json["transportationcost"],
      totalPrice: json["totalprice"],
      date: json["date"],
      time: json["time"],
      status: json["status"],
      orderStatus: json["order_status"],
      items: json["items"],
      address: json["address"],
      service: json["service"],
      user: json["user"],
      notes: json["text"],
      orderDataId: json['order_data_id'],
      serviceId: json['service_id'],
      tax: json['tax'],
      discount: json['discount'],
      addressId: json['address_id'],
      text: json['text'],
      pull: json['pull'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      invoice: OrderDetailInvoiceModel.fromJson(json['factor']),
    );
  }

  @override
  String toString() {
    return 'OrderDetails(id: $id, orderDataId: $orderDataId, serviceId: $serviceId, userId: $userId, priceServices: $priceServices, priceProduct: $priceProduct, transportationCost: $transportationCost, tax: $tax, discount: $discount, totalPrice: $totalPrice, addressId: $addressId, date: $date, time: $time, text: $text, status: $status, orderStatus: $orderStatus, pull: $pull, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, items: $items, address: $address, service: $service, user: $user, notes: $notes, invoice: $invoice)';
  }

  @override
  bool operator ==(covariant OrderDetails other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.orderDataId == orderDataId &&
        other.serviceId == serviceId &&
        other.userId == userId &&
        other.priceServices == priceServices &&
        other.priceProduct == priceProduct &&
        other.transportationCost == transportationCost &&
        other.tax == tax &&
        other.discount == discount &&
        other.totalPrice == totalPrice &&
        other.addressId == addressId &&
        other.date == date &&
        other.time == time &&
        other.text == text &&
        other.status == status &&
        other.orderStatus == orderStatus &&
        other.pull == pull &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        listEquals(other.items, items) &&
        other.address == address &&
        other.service == service &&
        other.user == user &&
        other.notes == notes &&
        other.invoice == invoice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        orderDataId.hashCode ^
        serviceId.hashCode ^
        userId.hashCode ^
        priceServices.hashCode ^
        priceProduct.hashCode ^
        transportationCost.hashCode ^
        tax.hashCode ^
        discount.hashCode ^
        totalPrice.hashCode ^
        addressId.hashCode ^
        date.hashCode ^
        time.hashCode ^
        text.hashCode ^
        status.hashCode ^
        orderStatus.hashCode ^
        pull.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        items.hashCode ^
        address.hashCode ^
        service.hashCode ^
        user.hashCode ^
        notes.hashCode ^
        invoice.hashCode;
  }
}
