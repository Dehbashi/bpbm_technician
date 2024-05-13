import 'package:bpbm_technician/data/models/profile_model/profile_model.dart';

class SeenModel {
  final int userId;
  final int commentId;
  final ProfileModel profile;

  const SeenModel({
    required this.userId,
    required this.commentId,
    required this.profile,
  });

  SeenModel.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        commentId = json['comment_id'],
        profile = ProfileModel.fromJson(json['profile']);
}
