part of 'notes_bloc.dart';

@immutable
abstract class NotesState extends Equatable {
  final List<NoteModel> notes;

  const NotesState({required this.notes});

  @override
  List<Object> get props => [notes];
}

class NotesInitial extends NotesState {
  NotesInitial() : super(notes: []);
}

class NotesLoaded extends NotesState {
  const NotesLoaded({required List<NoteModel> notes}) : super(notes: notes);
}

class NotesError extends NotesState {
  final String message;

  const NotesError({required this.message}) : super(notes: const []);

  @override
  List<Object> get props => [message, notes];
}
