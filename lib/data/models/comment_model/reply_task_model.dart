class ReplyTaskModel {
  final int id;
  final String title;
  final String priority;
  final String? text;
  final String? file;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  const ReplyTaskModel({
    required this.id,
    required this.title,
    required this.priority,
    required this.text,
    required this.file,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  ReplyTaskModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        priority = json['priority'],
        text = json['text'],
        file = json['file'],
        status = json['status'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        deletedAt = json['deleted_at'];
}
