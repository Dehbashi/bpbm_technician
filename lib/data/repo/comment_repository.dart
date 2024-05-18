import 'package:bpbm_technician/data/models/comment_model/comment_model.dart';
import 'package:bpbm_technician/data/models/send_comment_model.dart';
import 'package:bpbm_technician/data/source/comment_data_source.dart';
import 'package:image_picker/image_picker.dart';

final commentRepository =
    CommentRepository(dataSource: CommentRemoteDataSource());

abstract class ICommentRepository {
  Future<List<CommentModel>> fetchComments({required int orderId});
  Future<SendCommentModel> sendComment({
    required String text,
    required int orderId,
    required List<XFile> attachments,
  });
}

class CommentRepository implements ICommentRepository {
  final ICommentDataSource dataSource;

  const CommentRepository({required this.dataSource});

  @override
  Future<List<CommentModel>> fetchComments({required int orderId}) async {
    return dataSource.fetchComments(orderId: orderId);
  }

  @override
  Future<SendCommentModel> sendComment({
    required String text,
    required int orderId,
    required List<XFile> attachments,
  }) async {
    return dataSource.sendComment(
      text: text,
      orderId: orderId,
      attachments: attachments,
    );
  }
}
