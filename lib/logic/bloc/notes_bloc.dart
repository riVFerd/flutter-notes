import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes/logic/models/note_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NoteBloc extends Bloc<NotesEvent, NotesState> {
  NoteBloc() : super(NotesInitial()) {
    on<LoadNote>((event, emit) {
      // TODO: implement event handler to fetch notes from database
    });
    on<AddNote>((event, emit) {
      // TODO: implement event handler to add note to database
    });
    on<DeleteNote>((event, emit) {
      // TODO: implement event handler to delete note from database
    });
    on<UpdateNote>((event, emit) {
      // TODO: implement event handler to update note in database
    });
  }
}
