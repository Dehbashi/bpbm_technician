import 'package:bpbm_technician/blocs/comment_bloc/comment_bloc.dart';
import 'package:bpbm_technician/screens/auth_screens/auth_widgets/button_widget.dart';
import 'package:bpbm_technician/screens/notes_screen/methods/show_image_picker_modal.dart';
import 'package:bpbm_technician/screens/notes_screen/widgets/notes_screen_text_field_attachments.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NotesScreenTextField extends StatefulWidget {
  final CommentBloc bloc;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function() onSendPressed;
  final FocusNode focusNode;
  final Color sendButtonColor;
  final List<XFile> userAttachments;

  const NotesScreenTextField({
    super.key,
    required this.focusNode,
    required this.bloc,
    required this.controller,
    required this.onChanged,
    required this.onSendPressed,
    required this.sendButtonColor,
    required this.userAttachments,
  });

  @override
  State<NotesScreenTextField> createState() => _NotesScreenTextFieldState();
}

class _NotesScreenTextFieldState extends State<NotesScreenTextField> {
  // List<XFile> userAttachments = [];

  void loseFocus() {
    widget.focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotesScreenTextFieldAttachments(
          userAttachments: widget.userAttachments,
        ),
        TextField(
          focusNode: widget.focusNode,
          controller: widget.controller,
          onChanged: widget.onChanged,
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
                loseFocus();
                await showImagePickerModal(
                  context: context,
                  userAttachments: widget.userAttachments,
                  bloc: widget.bloc,
                );
                setState(() {});
              },
            ),
            prefixIcon: Directionality(
              textDirection: TextDirection.ltr,
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  size: 30,
                  color: widget.sendButtonColor,
                ),
                onPressed: widget.controller.text.isEmpty
                    ? null
                    : widget.onSendPressed,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'یادداشت خود را بگذارید',
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
      ],
    );
  }
}
