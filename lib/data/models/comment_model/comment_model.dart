import 'package:bpbm_technician/data/models/comment_model/attach_model.dart';
import 'package:bpbm_technician/data/models/comment_model/reply_comment_model.dart';
import 'package:bpbm_technician/data/models/comment_model/seen_model.dart';
import 'package:bpbm_technician/data/models/profile_model/profile_model.dart';

class CommentModel {
  final int id;
  final int orderId;
  final String type;
  final String text;
  final int replyId;
  final int userId;
  final int? hiddenUserId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<AttachModel> attach;

  const CommentModel({
    required this.id,
    required this.orderId,
    required this.type,
    required this.text,
    required this.replyId,
    required this.userId,
    required this.hiddenUserId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.attach,
  });

  CommentModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        orderId = json['order_id'],
        type = json['type'],
        text = json['text'],
        replyId = json['replay_id'],
        userId = json['user_id'],
        hiddenUserId = json['hidden_user_id'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        deletedAt = json['deleted_at'],
        attach = (json['attach'] as List<dynamic>).map((attach) {
          return AttachModel.fromJson(attach);
        }).toList();
}
