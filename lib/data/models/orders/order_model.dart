class Order {
  final int id;
  final String service;
  final String customerName;
  final int order_status;
  final String created_at;

  const Order({
    required this.id,
    required this.service,
    required this.customerName,
    required this.order_status,
    required this.created_at,
  });

  Order.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        service = json["service"],
        customerName = json['user']['name'],
        order_status = json["order_status"],
        created_at = json["created_at"];

  @override
  String toString() {
    return 'Order(id: $id, service: $service, customerName: $customerName, order_status: $order_status, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.service == service &&
        other.customerName == customerName &&
        other.order_status == order_status &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        service.hashCode ^
        customerName.hashCode ^
        order_status.hashCode ^
        created_at.hashCode;
  }
}
