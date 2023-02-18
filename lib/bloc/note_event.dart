part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class AddNote extends NoteEvent {
  final NoteModel note;

  const AddNote({required this.note});

  @override
  List<Object> get props => [note];
}

class DeleteNote extends NoteEvent {
  final NoteModel note;

  const DeleteNote({required this.note});

  @override
  List<Object> get props => [note];
}

class UpdateNote extends NoteEvent {
  final NoteModel note;

  const UpdateNote({required this.note});

  @override
  List<Object> get props => [note];
}

class LoadNote extends NoteEvent {}