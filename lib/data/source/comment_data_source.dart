import 'dart:convert';

import 'package:bpbm_technician/data/models/comment_model/comment_model.dart';
import 'package:bpbm_technician/data/models/comment_model/file_model.dart';
import 'package:bpbm_technician/data/models/send_comment_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

abstract class ICommentDataSource {
  Future<List<CommentModel>> fetchComments({required int orderId});
  Future<SendCommentModel> sendComment({
    required String text,
    required int orderId,
    required List<XFile> attachments,
  });
}

class CommentRemoteDataSource implements ICommentDataSource {
  @override
  Future<List<CommentModel>> fetchComments({required int orderId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =
        Uri.parse('https://s1.lianerp.com/api/public/provider/order/show');
    final headers = {
      'Authorization': 'Bearer $token',
      'Tokenpublic': 'bpbm',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'id': orderId,
    });
    // final response = await http.post(url, headers: headers, body: body);

    var request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    request.fields['id'] = orderId.toString();
    final response = await request.send();

    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body);
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);
      final mainData = data['data']['commentlist'] as List<dynamic>;
      List<CommentModel> comments = [];
      for (var item in mainData) {
        comments.add(CommentModel.fromJson(item));
      }
      return comments;
    } else {
      throw Exception(response.statusCode);
    }
  }

  @override
  Future<SendCommentModel> sendComment({
    required String text,
    required int orderId,
    required List<XFile> attachments,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url = Uri.parse(
        'https://s1.lianerp.com/api/public/provider/order/send-comment');
    final headers = {
      'Authorization': 'Bearer $token',
      'Tokenpublic': 'bpbm',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'id': orderId,
      'text': text,
      // 'attach': attachments,
    });
    // final response = await http.post(url, headers: headers, body: body);

    var request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    request.fields['id'] = orderId.toString();
    request.fields['text'] = text;

    for (var attachment in attachments) {
      var stream =
          http.ByteStream(Stream.castFrom(await attachment.openRead()));
      var length = await attachment.length();
      var multipartFile = http.MultipartFile(
        'attach',
        stream,
        length,
        filename: attachment.path.split('/').last,
      );
      request.files.add(multipartFile);
    }
    print(attachments.length);

    final response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body);
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);
      print(responseBody);
      final mainData = data['data']['data'];
      final sendComment = SendCommentModel.fromJson(mainData);
      return sendComment;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
