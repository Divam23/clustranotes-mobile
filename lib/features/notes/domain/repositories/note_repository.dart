import 'dart:io';

import 'package:clustranotes_mobile/features/notes/data/models/create_note_dto.dart';
import 'package:clustranotes_mobile/features/notes/models/note_model.dart';

abstract interface class NoteRepository {
  Future<Note> createNote({required CreateNoteDto note, required File file, void Function(int sent, int total)? onSendProgress });
}
