import 'package:bpbm_technician/blocs/comment_bloc/comment_bloc.dart';
import 'package:bpbm_technician/screens/notes_screen/methods/show_image_picker_modal.dart';
import 'package:flutter/material.dart';

class NotesScreenTextField extends StatelessWidget {
  final CommentBloc bloc;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function() onSendPressed;
  final FocusNode focusNode;
  final Color sendButtonColor;

  const NotesScreenTextField({
    super.key,
    required this.focusNode,
    required this.bloc,
    required this.controller,
    required this.onChanged,
    required this.onSendPressed,
    required this.sendButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      // expands: true,
      // maxLines: null,
      // minLines: null,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.camera_alt,
            size: 30,
          ),
          onPressed: () async {
            await showImagePickerModal(
              context: context,
              bloc: bloc,
            );
          },
        ),
        prefixIcon: Directionality(
          textDirection: TextDirection.ltr,
          child: IconButton(
            icon: Icon(
              Icons.send,
              size: 30,
              color: sendButtonColor,
            ),
            onPressed: controller.text.isEmpty ? null : onSendPressed,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'یادداشت خود را بگذارید',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey,
            ),
      ),
    );
  }
}
