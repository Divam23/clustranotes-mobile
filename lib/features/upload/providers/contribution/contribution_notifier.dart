import 'package:clustranotes_mobile/core/errors/app_failure.dart';
import 'package:clustranotes_mobile/core/errors/app_failure_mapper.dart';
import 'package:clustranotes_mobile/core/errors/exceptions/app_exception.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_list_filter.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_owner_status_mapper.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_loading_action.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_loading_action_status.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/pagination_params.dart';
import 'package:clustranotes_mobile/features/upload/domain/repositories/upload_repository.dart';
import 'package:clustranotes_mobile/features/upload/providers/contribution/contribution_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';



class ContributionNotifier extends StateNotifier<ContributionState> {
  final UploadRepository _uploadRepository;
  ContributionNotifier(this._uploadRepository) : super(const ContributionState());
  
  Future<void> changeFilter(NoteOwnerStatus? ownerStatus, ) async{
    final selectedStatus = ownerStatus == state.selectedStatus ? null : ownerStatus; 
    state = state.copyWith(
      selectedStatus: selectedStatus,
      notes: [],
      currentPage: 1,
      isLoadingMore: false,
      hasReachedEnd: false,
      error: null
    );
    final filters = selectedStatus != null ? NoteOwnerStatusMapper.noteListFilterMapper(selectedStatus) : const NoteListFilters(
      notePublishStatus: null,
      noteVerificationStatus: null,
    );
    await getUserUploadedNotes(filters, const PaginationParams());
  }

  Future<void> getUserUploadedNotes(NoteListFilters? filters, PaginationParams pagination) async {
    if(state.isLoading || pagination.page > 1  && (state.isLoadingMore || state.hasReachedEnd)){
      return;
    }
    try {
      state = state.copyWith(
        isLoading: pagination.page == 1,
        isLoadingMore: pagination.page > 1,
        loadingAction: UploadLoadingAction.notes,
        uploadLoadingActionStatus: UploadLoadingActionStatus.fetching,
        error: null
      );
      final response = await _uploadRepository.getUserUploadedNotes(filter: filters, pagination: pagination);
      if (!mounted) return;
      state = state.copyWith(
        notes: pagination.page == 1 ? response.notes : [...state.notes, ...response.notes],
        currentPage: response.paginationInfo.page,
        pageSize: response.paginationInfo.limit,
        hasReachedEnd: response.paginationInfo.totalPages <= response.paginationInfo.page,
        
      );
    } on AppException catch (exception) {
      if (!mounted) return;
      state = state.copyWith(
        error: AppFailureMapper.map(exception),
        uploadLoadingActionStatus: UploadLoadingActionStatus.failure,
      );
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      debugPrint("Error: $error");
      if (!mounted) return;
      state = state.copyWith(
        error: const AppFailure(
          message: 'Something went wrong. Please try again.',
          retryable: true,
        ),
        uploadLoadingActionStatus: UploadLoadingActionStatus.failure,
      );
    } finally {
      if (mounted) {
        state = state.copyWith(isLoading: false, isLoadingMore: false, uploadLoadingActionStatus: null);
      }
    }
  }

  Future<void> getNoteStatusStats() async {
    if (!mounted || (state.isLoading && state.loadingAction == UploadLoadingAction.stats) ) return;

    try {
      state = state.copyWith(isLoading: true, loadingAction: UploadLoadingAction.idle, error: null);
      final statsData = await _uploadRepository.getNoteStatusStats();
      if (!mounted) return;
      state = state.copyWith(noteStatusStats: statsData);
    } on AppException catch (exception) {
      if (!mounted) return;
      state = state.copyWith(error: AppFailureMapper.map(exception));
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      if (!mounted) return;
      state = state.copyWith(
        error: const AppFailure(
          message: 'Something went wrong. Please try again.',
          retryable: true,
        ),
      );
    } finally {
      if (mounted) state = state.copyWith(isLoading: false);
    }
  }
  
  
  
  
}
