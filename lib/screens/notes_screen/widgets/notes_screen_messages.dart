import 'package:bpbm_technician/app_theme/app_theme.dart';
import 'package:bpbm_technician/common/methods/gregorian_to_shamsi.dart';
import 'package:bpbm_technician/common/widgets/my_vertical_divider.dart';
import 'package:bpbm_technician/data/models/comment_model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

class NotesScreenMessages extends StatefulWidget {
  final TextEditingController messageController;
  final FocusNode focusNode;
  final List<CommentModel> comments;
  const NotesScreenMessages({
    super.key,
    required this.messageController,
    required this.focusNode,
    required this.comments,
  });

  @override
  State<NotesScreenMessages> createState() => _NotesScreenMessagesState();
}

class _NotesScreenMessagesState extends State<NotesScreenMessages> {
  // late List<bool> _isSwipingList;
  // double _startX = 0;
  // double _currentX = 0;
  // bool _isSwiping = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _isSwipingList = List.generate(widget.comments.length, (_) => false);
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        reverse: true,
        itemCount: widget.comments.length,
        itemBuilder: (context, index) {
          final comment = widget.comments[index];
          final attachments = comment.attach;
          // return SwipeableItem(
          //   isSwiping: _isSwipingList[index],
          //   onSwipingChanged: (isSwiping) {
          //     setState(() {
          //       _isSwipingList[index] = isSwiping;
          //     });
          //   },
          //   onSwipingEnd: () {
          //     widget.focusNode.requestFocus();
          //     // print(index);
          //   },
          //   child:
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppTheme.light().primary.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (comment.text.contains('<p>'))
                  HtmlWidget(
                    comment.text,
                  ),
                if (!comment.text.contains('<p>'))
                  Text(
                    comment.text,
                    softWrap: true,
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (attachments.isNotEmpty)
                  Row(
                    children: [
                      ...attachments.map((attachment) {
                        return Tooltip(
                          message: attachment.name,
                          child: IconButton(
                            icon: Icon(
                              Icons.attachment,
                              size: 20,
                            ),
                            onPressed: () async {
                              final url = Uri.parse(
                                  'https://s1.lianerp.com/attach/shopmaker/order/${attachment.name}?tenant=bpbm');
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $url');
                              }
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                Row(
                  children: [
                    Text(
                      comment.createdAt != null
                          ? gregorianToShamsiDateOnlyWithSlash(
                              comment.createdAt!)
                          : '',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppTheme.light().neutral.shade400,
                          ),
                    ),
                    MyVerticalDivider(),
                    Text(
                      comment.createdAt != null
                          ? gregorianToShamsiTimeOnlyWithoutText(
                              comment.createdAt!)
                          : '',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppTheme.light().neutral.shade400,
                          ),
                    )
                  ],
                ),
              ],
            ),
            // ),
          );
        },
      ),
    );
  }
}
