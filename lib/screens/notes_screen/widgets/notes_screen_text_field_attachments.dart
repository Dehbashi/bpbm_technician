import 'package:bpbm_technician/screens/auth_screens/auth_widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

class NotesScreenTextFieldAttachments extends StatefulWidget {
  final List<XFile> userAttachments;
  const NotesScreenTextFieldAttachments(
      {super.key, required this.userAttachments});

  @override
  State<NotesScreenTextFieldAttachments> createState() =>
      _NotesScreenTextFieldAttachmentsState();
}

class _NotesScreenTextFieldAttachmentsState
    extends State<NotesScreenTextFieldAttachments> {
  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      buttonWidth: double.infinity,
      color: Theme.of(context).colorScheme.onPrimary,
      onPressed: () {
        // loseFocus();
        showDialog(
          context: context,
          builder: (ctx) {
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: Column(
                    children: [
                      Text('پیوست ها'),
                      Text(
                        'برای پاک کردن انگشت خود را بر روی پیوست نگه دارید',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: widget.userAttachments.map((userAttachment) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () async {
                            var result =
                                await OpenFile.open(userAttachment.path);
                            if (result.type != ResultType.done) {
                              print('Error opening file: ${result.message}');
                            }
                          },
                          onLongPress: () {
                            setState(() {
                              widget.userAttachments.remove(userAttachment);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Text(userAttachment.name),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      text: 'پیوست های انتخاب شده',
    );
  }
}
