import 'package:bpbm_technician/data/fake_data.dart';
import 'package:flutter/material.dart';

class NotesScreenMessages extends StatelessWidget {
  const NotesScreenMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        reverse: true,
        itemCount: fakeData.length,
        itemBuilder: (context, index) {
          final message = fakeData[index];
          return Container(
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
                  DateTime.now().toIso8601String(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
