part of 'note_bloc.dart';

sealed class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

final class NoteInitial extends NoteState {}

class NoteSuccess extends NoteState {}

class NoteEmpty extends NoteState {}

class NoteFailed extends NoteState {}
