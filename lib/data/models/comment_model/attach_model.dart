class AttachModel {
  final int commentId;
  final String name;
  final int id;

  const AttachModel({
    required this.commentId,
    required this.name,
    required this.id,
  });

  AttachModel.fromJson(Map<String, dynamic> json)
      : commentId = json['comment_id'],
        name = json['name'],
        id = json['id'];
}
