class SendCommentModel {
  final int orderId;
  final String text;
  final String type;
  final int userId;
  final String? createdAt;
  final String? updatedAt;
  final int id;

  const SendCommentModel({
    required this.orderId,
    required this.text,
    required this.type,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  SendCommentModel.fromJson(Map<String, dynamic> json)
      : orderId = (json['order_id'] is String)
            ? int.parse(json['order_id'])
            : json['order_id'],
        text = json['text'],
        type = json['type'],
        userId = json['user_id'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        id = json['id'];
}
