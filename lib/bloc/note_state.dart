part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  final List<NoteModel> notes;

  const NoteState({required this.notes});

  @override
  List<Object> get props => [notes];
}

class NoteInitial extends NoteState {
  NoteInitial() : super(notes: []);
}

class NoteLoaded extends NoteState {
  const NoteLoaded({required List<NoteModel> notes}) : super(notes: notes);

  NoteLoaded copyWith({List<NoteModel>? notes}) {
    return NoteLoaded(notes: notes ?? this.notes);
  }
}
