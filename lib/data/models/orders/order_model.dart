class Order {
  final int id;
  final String service;
  final int order_status;
  final String created_at;

  Order(
      {required this.id,
      required this.service,
      required this.order_status,
      required this.created_at});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["id"],
      service: json["service"],
      order_status: json["order_status"],
      created_at: json["created_at"],
    );
  }
}
