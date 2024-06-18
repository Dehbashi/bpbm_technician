class Order {
  final int id;
  final String service;
  final String customerName;
  final int order_status;
  final String created_at;

  Order(
      {required this.id,
      required this.service,
      required this.customerName,
      required this.order_status,
      required this.created_at});

  Order.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        service = json["service"],
        customerName = json['user']['name'],
        order_status = json["order_status"],
        created_at = json["created_at"];
}
