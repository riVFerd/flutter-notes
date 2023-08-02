import 'note_model.dart';

class NoteDetailArguments {
  const NoteDetailArguments({this.note, this.editMode = false});

  final NoteModel? note;
  final bool editMode;
}
