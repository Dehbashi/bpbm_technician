import 'dart:convert';

import 'package:bpbm_technician/data/models/comment_model/comment_model.dart';
import 'package:bpbm_technician/data/models/comment_model/file_model.dart';
import 'package:bpbm_technician/data/models/send_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

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
    // final url =
    //     Uri.parse('https://s1.lianerp.com/api/shopmaker/order/comment/send');
    final headers = {
      'Authorization': 'Bearer $token',
      'Tokenpublic': 'bpbm',
      // 'Authorizationserver':
      //     'Bearer 2669|yzFaepWCMUIhmEuGMaaLInGXQweAoYUpWGdFYNnm',
      // 'Content-Type': 'multipart/form-data',
      'Content-Type': 'application/json',
      'Accept': 'application/json, text/plain, */*',
    };
    // final body = jsonEncode({
    //   'id': orderId,
    //   'text': text,
    //   // 'attach': attachments,
    // });
    // final response = await http.post(url, headers: headers, body: body);

    var request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    request.fields['id'] = orderId.toString();
    // request.fields['data_id'] = orderId.toString();
    request.fields['text'] = text;
    request.fields['type'] = 'normal';

    for (var attachment in attachments) {
      var stream =
          http.ByteStream(Stream.castFrom(await attachment.openRead()));
      var length = await attachment.length();
      var multipartFile = http.MultipartFile(
        'file[]',
        stream,
        length,
        filename: basename(attachment.path),
        // filename: attachment.path.split('/').last,
      );
      // var multipartFile = http.MultipartFile(
      //   'attach',
      //   attachment.readAsBytes().asStream(),
      //   await attachment.length(),
      //   filename: attachment.path.split('/').last,
      // );
      request.files.add(multipartFile);
    }

    print(request.fields);
    print(request.files);

    final response = await request.send();
    // final data = await response.stream.bytesToString();
    // print(jsonDecode(data));
    // print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);
      print(responseBody);
      final mainData = data['data']['data'];
      // final mainData = data;
      print(mainData['attach']);
      final sendComment = SendCommentModel.fromJson(mainData);
      return sendComment;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
