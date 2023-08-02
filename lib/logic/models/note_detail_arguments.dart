import 'note_model.dart';

class NoteDetailArguemnts {
  const NoteDetailArguemnts({this.note, this.editMode = false});

  final NoteModel? note;
  final bool editMode;
}
