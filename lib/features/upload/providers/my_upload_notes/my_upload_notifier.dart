import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/providers/my_upload_notes/my_upload_state.dart';
import 'package:flutter_riverpod/legacy.dart';

final myUploadedNoteProvider =
    StateNotifierProvider<MyUploadNotifier, MyUploadState>((ref) {
      return MyUploadNotifier();
    });

class MyUploadNotifier extends StateNotifier<MyUploadState> {
  MyUploadNotifier() : super(const MyUploadState());
  
  void changeFilter(NoteOwnerStatus? ownerStatus){
    state = state.copyWith(
      selectedStatus: ownerStatus,
      
    );
  }
}
