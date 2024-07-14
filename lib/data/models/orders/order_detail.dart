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
}
