import 'package:bpbm_technician/data/models/comment_model/attach_model.dart';
import 'package:bpbm_technician/data/models/comment_model/reply_comment_model.dart';
import 'package:bpbm_technician/data/models/comment_model/seen_model.dart';
import 'package:bpbm_technician/data/models/profile_model/profile_model.dart';

class CommentModel {
  final int id;
  final int userId;
  final String type;
  final String createdAt;
  final String text;
  final int replyId;
  final int? hiddenUserId;
  final ProfileModel profile;
  final List<SeenModel> seen;
  final List<AttachModel> attach;
  final ReplyCommentModel? reply;

  const CommentModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.createdAt,
    required this.text,
    required this.replyId,
    required this.hiddenUserId,
    required this.profile,
    required this.seen,
    required this.attach,
    required this.reply,
  });

  CommentModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['user_id'],
        type = json['type'],
        createdAt = json['created_at'],
        text = json['text'],
        replyId = json['replay_id'],
        hiddenUserId = json['hidden_user_id'],
        profile = ProfileModel.fromJson(json['profile']),
        seen = (json['seen'] as List<dynamic>).map((item) {
          return SeenModel.fromJson(item);
        }).toList(),
        attach = (json['attach'] as List<dynamic>).map((item) {
          return AttachModel.fromJson(item);
        }).toList(),
        reply = json['replay'] != null
            ? ReplyCommentModel.fromJson(json['replay'])
            : null;
}
