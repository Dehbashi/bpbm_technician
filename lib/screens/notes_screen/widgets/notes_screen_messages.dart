import 'package:bpbm_technician/common/methods/gregorian_to_shamsi.dart';
import 'package:bpbm_technician/common/widgets/swipable_item.dart';
import 'package:bpbm_technician/data/fake_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NotesScreenMessages extends StatefulWidget {
  final TextEditingController messageController;
  final FocusNode focusNode;
  const NotesScreenMessages({
    super.key,
    required this.messageController,
    required this.focusNode,
  });

  @override
  State<NotesScreenMessages> createState() => _NotesScreenMessagesState();
}

class _NotesScreenMessagesState extends State<NotesScreenMessages> {
  late List<bool> _isSwipingList;
  double _startX = 0;
  double _currentX = 0;
  bool _isSwiping = false;

  @override
  void initState() {
    super.initState();
    _isSwipingList = List.generate(fakeData.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        reverse: true,
        itemCount: fakeData.length,
        itemBuilder: (context, index) {
          final message = fakeData[index];
          return SwipeableItem(
            isSwiping: _isSwipingList[index],
            onSwipingChanged: (isSwiping) {
              setState(() {
                _isSwipingList[index] = isSwiping;
              });
            },
            onSwipingEnd: () {
              widget.focusNode.requestFocus();
              print(index);
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message['text']),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    gregorianToShamsi(DateTime.now().toString()),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
