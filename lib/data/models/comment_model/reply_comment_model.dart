import 'package:bpbm_technician/data/models/comment_model/reply_task_model.dart';
import 'package:bpbm_technician/data/models/profile_model/profile_model.dart';

class ReplyCommentModel {
  final int id;
  final String text;
  final int userId;
  final int? taskId;
  final ProfileModel profile;
  final ReplyTaskModel? task;

  const ReplyCommentModel({
    required this.id,
    required this.text,
    required this.userId,
    required this.taskId,
    required this.profile,
    required this.task,
  });

  ReplyCommentModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        userId = json['user_id'],
        taskId = json['task_id'],
        profile = ProfileModel.fromJson(json['profile']),
        task =
            json['task'] == null ? null : ReplyTaskModel.fromJson(json['task']);
}
