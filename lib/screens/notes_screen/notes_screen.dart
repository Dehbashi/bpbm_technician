import 'package:bpbm_technician/blocs/comment_bloc/comment_bloc.dart';
import 'package:bpbm_technician/screens/notes_screen/widgets/notes_screen_header.dart';
import 'package:bpbm_technician/screens/notes_screen/widgets/notes_screen_messages.dart';
import 'package:bpbm_technician/screens/notes_screen/widgets/notes_screen_text_field.dart';
import 'package:flutter/material.dart';
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
  late CommentBloc bloc;
  late TextEditingController messageController;
  FocusNode _focusNode = FocusNode();
  Color sendButtonColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CommentBloc>(context);
    bloc.add(CommentStarted(orderId: widget.orderId));
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    messageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        if (state is CommentFailed) {
          return Center(
            child: Text('خطا در بارگذاری یادداشت ها'),
          );
        } else if (state is CommentSuccess) {
          final comments = state.comments;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NotesScreenHeader(
                  orderId: widget.orderId,
                  orderTitle: widget.orderTitle,
                ),
                if (comments.isNotEmpty)
                  NotesScreenMessages(
                    comments: comments,
                    messageController: messageController,
                    focusNode: _focusNode,
                  ),
                if (comments.isEmpty)
                  Center(
                    child: Text(
                      'برای این سفارش یادداشتی وجود ندارد',
                    ),
                  ),
                NotesScreenTextField(
                  bloc: bloc,
                  focusNode: _focusNode,
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
                  onSendPressed: () {
                    bloc.add(
                      SendComment(
                        orderId: widget.orderId,
                        text: messageController.text,
                      ),
                    );
                    messageController.clear();
                    setState(() {
                      sendButtonColor = Colors.grey;
                    });
                  },
                  sendButtonColor: sendButtonColor,
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
