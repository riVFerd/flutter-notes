part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class AddNote extends NotesEvent {
  final NoteModel note;

  const AddNote({required this.note});

  @override
  List<Object> get props => [note];
}

class DeleteNote extends NotesEvent {
  final NoteModel note;

  const DeleteNote({required this.note});

  @override
  List<Object> get props => [note];
}

class UpdateNote extends NotesEvent {
  final NoteModel note;

  const UpdateNote({required this.note});

  @override
  List<Object> get props => [note];
}

class LoadNote extends NotesEvent {}