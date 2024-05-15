part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class NoteStarted extends NoteEvent {}

class AttachImageFromCamera extends NoteEvent {}

class AttachImageFromGallery extends NoteEvent {}

class SendNote extends NoteEvent {
  final File pickedFile;
  final String text;

  const SendNote({
    required this.pickedFile,
    required this.text,
  });

  @override
  List<Object> get props => [
        pickedFile,
        text,
      ];
}
