class OrderDetails {
  final int id;
  final int userId;
  final int priceServices;
  final String priceProduct;
  final String transportationCost;
  final String totalPrice;
  final String date;
  final String time;
  final int status;
  final int orderStatus;
  final List items;
  final dynamic address;
  final dynamic service;
  final dynamic user;
  final String? notes;

  OrderDetails({
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
    );
  }
}
