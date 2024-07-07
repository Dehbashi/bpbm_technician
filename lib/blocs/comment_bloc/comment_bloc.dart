import 'dart:io';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bpbm_technician/common/customer_error_messenger.dart';
import 'package:bpbm_technician/common/dialogs/loading_screen.dart';
import 'package:bpbm_technician/data/models/comment_model/attach_model.dart';
import 'package:bpbm_technician/data/models/comment_model/comment_model.dart';
import 'package:bpbm_technician/data/repo/comment_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final BuildContext context;
  CommentBloc(this.context) : super(CommentInitial()) {
    List<XFile> userAttachments = [];
    List<CommentModel> userComments = [];

    on<CommentEvent>((event, emit) async {
      if (event is CommentStarted) {
        LoadingScreen.instance().show(
          context: context,
          text: 'در حال بارگذاری',
        );
        await commentRepository
            .fetchComments(orderId: event.orderId)
            .then((comments) {
          userComments = comments;
          emit(CommentSuccess(
            comments: userComments,
            attachments: userAttachments,
          ));
          LoadingScreen.instance().hide();
        }).catchError((e) {
          emit(CommentFailed());
          LoadingScreen.instance().hide();
          customErrorMessenger(
            context: context,
            message: 'خطا در بارگذاری',
          );
        });
      }

      // if (event is SelectAttachment) {
      //   // SharedPreferences prefs = await SharedPreferences.getInstance();
      //   final cameraImage = await loadCameraImage();
      //   if (cameraImage != null && cameraImage != '') {
      //     userAttachments.add(cameraImage);
      //   }
      //   final galleryImages = await loadGalleryImages();
      //   if (galleryImages != null && galleryImages.isNotEmpty) {
      //     userAttachments.addAll(galleryImages);
      //   }

      //   emit(
      //     CommentSuccess(
      //       comments: userComments,
      //       attachments: userAttachments,
      //     ),
      //   );
      // }

      if (event is SendComment) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // List<XFile> attachments = [];
        LoadingScreen.instance().show(
          context: context,
          text: 'در حال ارسال پیام',
        );

        // final cameraImage = await loadCameraImage();
        // if (cameraImage != null && cameraImage != '')
        //   userAttachments.add(cameraImage);
        // final galleryImages = await loadGalleryImages();
        // if (galleryImages != null && galleryImages.isNotEmpty)
        //   userAttachments.addAll(galleryImages);

        // if (cameraImage != null) await upload(File(cameraImage.path));

        await commentRepository
            .sendComment(
          text: event.text,
          orderId: event.orderId,
          attachments: event.userAttachments,
        )
            .then((comment) async {
          await commentRepository
              .fetchComments(orderId: event.orderId)
              .then((comments) {
            userComments = comments;
            emit(CommentSuccess(
              comments: userComments,
              attachments: userAttachments,
            ));
            userAttachments.clear();
            prefs.remove('pickedFilePath');
            prefs.remove('imagesPaths');
            LoadingScreen.instance().hide();
          }).catchError((e) {
            userAttachments.clear();
            prefs.remove('pickedFilePath');
            prefs.remove('imagesPaths');
            LoadingScreen.instance().hide();
            customErrorMessenger(
              context: context,
              message: 'خطا در ارسال پیام',
            );
          });
        }).catchError((e) {
          print(e.toString());
          userAttachments.clear();
          prefs.remove('pickedFilePath');
          prefs.remove('imagesPaths');
          LoadingScreen.instance().hide();
          customErrorMessenger(
            context: context,
            message: 'خطای نامشخص',
          );
        });
      }
    });
  }

  Future<XFile?> getImageFromCamera() async {
    XFile? imageFile;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imageFile = XFile(pickedFile.path);
      await saveImageFromCamera(pickedFile);
      return imageFile;
    } else {
      return null;
    }
  }

  // Future<List<XFile>?> getImagesFromGallery() async {
  //   List<XFile> images = [];
  //   final picker = ImagePicker();
  //   try {
  //     images = await picker.pickMultiImage(limit: 10);
  //     await saveImageFromGallery(images);
  //     return images;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  Future<List<XFile>?> getImagesFromGallery() async {
    List<XFile> files = [];
    final picker = ImagePicker();

    try {
      // Pick images using image_picker
      // List<XFile>? images = await picker.pickMultiImage(limit: 3);
      // if (images != null) {
      //   files.addAll(images);
      // }

      // Pick PDFs using file_picker
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
        allowMultiple: true,
      );

      if (result != null) {
        for (var pdf in result.files) {
          files.add(XFile(pdf.path!));
        }
      }

      // Save the files (both images and PDFs)
      await saveImageFromGallery(files);
      return files;
    } catch (e) {
      return null;
    }
  }

  Future<void> saveImageFromCamera(XFile? pickedFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String imagePath;
    if (pickedFile != null) {
      imagePath = pickedFile.path;
    } else {
      imagePath = '';
    }
    await prefs.setString('pickedFilePath', imagePath);
  }

  Future<void> saveImageFromGallery(List<XFile> pickedImages) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> imagesPaths = [];
    if (pickedImages.isNotEmpty) {
      try {
        for (var pickedImage in pickedImages) {
          imagesPaths.add(pickedImage.path);
        }
      } catch (e) {
        print(e.toString());
      }
    }
    await prefs.setStringList('imagesPaths', imagesPaths);
  }

  Future<String?> getCameraImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pickedFilePath') ?? null;
  }

  Future<List<String>?> getGalleryImagesPaths() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('imagesPaths') ?? [];
  }

  Future<XFile?> loadCameraImage() async {
    String imagePath = await getCameraImagePath() ?? '';
    if (imagePath.isNotEmpty) {
      return XFile(imagePath);
    } else {
      return null;
    }
  }

  Future<List<XFile>?> loadGalleryImages() async {
    List<String> imagesPaths = await getGalleryImagesPaths() ?? [];

    List<XFile> images = [];
    for (String imagePath in imagesPaths) {
      images.add(XFile(imagePath));
    }

    if (images.isNotEmpty) {
      return images;
    } else {
      return null;
    }
  }

  // upload(File imageFile) async {
  //   // open a bytestream
  //   var stream =
  //       new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  //   // get file length
  //   var length = await imageFile.length();

  //   // string to uri
  //   var uri =
  //       Uri.parse("https://s1.lianerp.com/api/public/provider/order/show");

  //   // create multipart request
  //   var request = new http.MultipartRequest("POST", uri);

  //   // multipart that takes file
  //   var multipartFile = new http.MultipartFile('file', stream, length,
  //       filename: basename(imageFile.path));

  //   // add file to multipart
  //   request.files.add(multipartFile);

  //   // send
  //   var response = await request.send();
  //   print(response.statusCode);

  //   // listen for response
  //   response.stream.transform(utf8.decoder).listen((value) {
  //     print(value);
  //   });
  // }
}
