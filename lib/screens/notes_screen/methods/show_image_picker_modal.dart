import 'package:bpbm_technician/blocs/comment_bloc/comment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

Future<void> showImagePickerModal({
  required BuildContext context,
  required CommentBloc bloc,
}) async {
  await showModalBottomSheet(
    backgroundColor: Theme.of(context).colorScheme.primary,
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          _ModalSheeListWidget(
            text: 'باز کردن دوربین',
            onTap: () async {
              final cameraFile = await bloc.getImageFromCamera();
              Navigator.of(context).pop();
              // if (cameraFile != null && cameraFile != '') {
              //   showAttachmentModal(
              //       attachments: [cameraFile], context: context);
              // }
            },
          ),
          _ModalSheeListWidget(
            text: 'انتخاب از گالری',
            onTap: () async {
              final galleryFiles = await bloc.getImagesFromGallery();
              Navigator.of(context).pop();
              // if (galleryFiles != null && galleryFiles.isNotEmpty) {
              //   showAttachmentModal(
              //       attachments: galleryFiles, context: context);
              // }
            },
          ),
        ],
      );
    },
  );
}

Future<void> showAttachmentModal({
  required List<XFile>? attachments,
  required BuildContext context,
}) async {
  if (attachments != null && attachments.isNotEmpty) {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.2,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
            ),
            itemCount: attachments.length,
            itemBuilder: (context, index) {
              final attachment = attachments[index];
              return IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.attachment,
                  size: 20,
                ),
              );
            },
          ),
        );
      },
    );
  }
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
