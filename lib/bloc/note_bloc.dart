import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/models/note_model.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<LoadNote>((event, emit) {
      emit(const NoteLoaded(notes: []));
    });
    on<AddNote>((event, emit) {
      emit(NoteLoaded(notes: List.from(state.notes)..add(event.note)));
    });
    on<DeleteNote>((event, emit) {
      emit(NoteLoaded(
        notes: List.from(state.notes)
          ..removeWhere((note) => note.id == event.note.id),
      ));
    });
    on<UpdateNote>((event, emit) {
      emit(NoteLoaded(
        notes: List.from(state.notes)
          ..removeWhere((note) => note.id == event.note.id)
          ..add(event.note),
      ));
    });
  }
}
