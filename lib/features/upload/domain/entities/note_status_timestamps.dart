import 'package:clustranotes_mobile/features/upload/domain/enums/note_timestamps_enum.dart';

class NoteStatusTimestamps{
  final NoteTimestampsEvent event;
  final DateTime timestamp;
  const NoteStatusTimestamps({
    required this.event,
    required this.timestamp,
  });
}
