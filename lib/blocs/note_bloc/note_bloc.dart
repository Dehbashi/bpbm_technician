import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<NoteEvent>((event, emit) async {
      if (event is NoteStarted) {
        emit(
          NoteSuccess(),
        );
      }

      if (event is AttachImageFromGallery) {
        await getImagesFromGallery();
        emit(
          NoteSuccess(),
        );
      }

      if (event is AttachImageFromCamera) {
        await getImageFromCamera();
        emit(NoteSuccess());
      }
    });
  }

  Future<void> getImageFromCamera() async {
    File? imageFile;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      await saveImageFromCamera(pickedFile);
    } else {
      print('no image selected');
    }
  }

  Future<void> getImagesFromGallery() async {
    List<XFile> images = [];
    final picker = ImagePicker();
    try {
      images = await picker.pickMultiImage();
      await saveImageFromGallery(images);
    } catch (e) {
      print(e.toString());
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

  Future<String> getCameraImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pickedFilePath') ?? '';
  }

  Future<List<String>> getGalleryImagesPaths() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('imagesPaths') ?? [];
  }
}
