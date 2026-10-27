import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/repositories/upload_repository.dart';
import 'package:clustranotes_mobile/features/upload/providers/my_upload_notes/my_upload_state.dart';
import 'package:flutter_riverpod/legacy.dart';



class MyUploadNotifier extends StateNotifier<ContributionState> {
  final UploadRepository _uploadRepository;
  MyUploadNotifier(this._uploadRepository) : super(const ContributionState());
  
  void changeFilter(NoteOwnerStatus? ownerStatus){
    state = state.copyWith(
      selectedStatus: ownerStatus,
    );
  }
  
  Future<void> getNoteStatusStats({required String userId})
  async{
    if(!mounted) return;
    if(state.isLoading) return;
    
    try{
      final statsData = await _uploadRepository.getNoteStatusStats(userId: userId);
      
    }catch(error){}finally{}
  }
  
}
