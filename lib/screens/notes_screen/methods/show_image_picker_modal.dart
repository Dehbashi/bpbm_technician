import 'package:bpbm_technician/blocs/note_bloc/note_bloc.dart';
import 'package:flutter/material.dart';

Future<void> showImagePickerModal(
    {required BuildContext context, required NoteBloc bloc}) async {
  await showModalBottomSheet(
    backgroundColor: Theme.of(context).colorScheme.primary,
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          _ModalSheeListWidget(
            text: 'باز کردن دوربین',
            onTap: () {
              bloc.add(
                AttachImageFromCamera(),
              );
            },
          ),
          _ModalSheeListWidget(
            text: 'انتخاب از گالری',
            onTap: () {
              bloc.add(
                AttachImageFromGallery(),
              );
            },
          ),
        ],
      );
    },
  );
}

class _ModalSheeListWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  const _ModalSheeListWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(26),
        topRight: Radius.circular(26),
      ),
      child: ListTile(
        leading: Icon(Icons.camera_alt),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
