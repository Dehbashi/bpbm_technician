import 'package:bpbm_technician/blocs/note_bloc/note_bloc.dart';
import 'package:bpbm_technician/data/fake_data.dart';
import 'package:bpbm_technician/screens/notes_screen/methods/show_image_picker_modal.dart';
import 'package:bpbm_technician/screens/notes_screen/widgets/notes_screen_header.dart';
import 'package:bpbm_technician/screens/notes_screen/widgets/notes_screen_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian/persian.dart';

class NotesScreen extends StatefulWidget {
  final int orderId;
  final String orderTitle;
  const NotesScreen({
    super.key,
    required this.orderId,
    required this.orderTitle,
  });

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  late NoteBloc bloc;
  late TextEditingController messageController;
  Color sendButtonColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NoteBloc>(context);
    bloc.add(NoteStarted());
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        if (state is NoteFailed) {
          return Center(
            child: Text('خطا در بارگذاری یادداشت ها'),
          );
        } else if (state is NoteSuccess) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotesScreenHeader(
                  orderId: widget.orderId,
                  orderTitle: widget.orderTitle,
                ),
                NotesScreenMessages(),
                TextField(
                  controller: messageController,
                  onChanged: (_) {
                    print(messageController.text.isEmpty);
                    setState(
                      () {
                        sendButtonColor = messageController.text.isEmpty
                            ? Colors.grey
                            : Colors.blue;
                      },
                    );
                  },
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
                      onPressed: () {
                        showImagePickerModal(
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
                        onPressed:
                            messageController.text.isEmpty ? null : () {},
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
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
