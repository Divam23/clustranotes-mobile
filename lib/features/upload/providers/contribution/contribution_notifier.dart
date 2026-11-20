import 'package:clustranotes_mobile/core/errors/app_failure.dart';
import 'package:clustranotes_mobile/core/errors/app_failure_mapper.dart';
import 'package:clustranotes_mobile/core/errors/exceptions/app_exception.dart';
import 'package:clustranotes_mobile/core/errors/exceptions/upload_cancelled_exception.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_list_filter.dart';
import 'package:clustranotes_mobile/features/upload/data/models/note_owner_status_mapper.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/note_owner_status_enum.dart';
import 'package:clustranotes_mobile/features/upload/domain/enums/upload_loading_action.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/pagination_params.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_note_card.dart';
import 'package:clustranotes_mobile/features/upload/domain/models/uploaded_notes_list_response_model.dart';
import 'package:clustranotes_mobile/features/upload/domain/repositories/upload_repository.dart';
import 'package:clustranotes_mobile/features/upload/providers/contribution/contribution_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ContributionNotifier extends StateNotifier<ContributionState> {
  late final PagingController<int, UploadedNoteCard> _pagingController;
  int _totalPages = 0;
  int _filterGeneration = 0;
  CancelToken? _cancelToken;

  final UploadRepository _uploadRepository;
  ContributionNotifier(this._uploadRepository)
    : super(const ContributionState()) {
    _pagingController = PagingController(
      getNextPageKey: (state) {
        if (state.pages?.isEmpty ?? true) return 1;
        final nextPage = state.nextIntPageKey;
        return nextPage <= _totalPages ? nextPage : null;
      },
      fetchPage: (pageKey) async {
        final generation = _filterGeneration;
        final cancelToken = _cancelToken ??= CancelToken();
        final currentFilters = filters;
          final response = await getUserUploadedNotes(
            currentFilters,
            PaginationParams(page: pageKey),
            cancelToken,
          );
          if (!mounted || generation != _filterGeneration) {
            throw DioException.requestCancelled(
              requestOptions: RequestOptions(),
              reason: 'Filter changed or notifier disposed',
            );
          }

          _totalPages = response.paginationInfo.totalPages;
          return response.notes;
      },
    );
  }

  PagingController<int, UploadedNoteCard> get pagingController =>
      _pagingController;

  void changeFilter(NoteOwnerStatus? ownerStatus) {
    final selectedStatus = ownerStatus == state.selectedStatus
        ? null
        : ownerStatus;
    _filterGeneration++;
    _totalPages = 0;

    final oldToken = _cancelToken;
    _cancelToken = CancelToken();
    
    state = state.copyWith(selectedStatus: selectedStatus);
    _pagingController.refresh();
    oldToken?.cancel();
  }

  NoteListFilters get filters {
    final selectedStatus = state.selectedStatus;
    if (selectedStatus == null) {
      return const NoteListFilters(
        notePublishStatus: null,
        noteVerificationStatus: null,
      );
    }
    return NoteOwnerStatusMapper.noteListFilterMapper(selectedStatus);
  }

  Future<UploadedNotesListResponseModel> getUserUploadedNotes(
    NoteListFilters? filters,
    PaginationParams pagination,
    CancelToken? cancelToken,
  ) async {
    try {
      final response = await _uploadRepository.getUserUploadedNotes(
        filter: filters,
        pagination: pagination,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (exception) {
      if (exception.type == DioExceptionType.cancel) {
        rethrow;
      }

      throw const AppFailure(
        message: 'Something went wrong. Please try again.',
        retryable: true,
      );
    } on AppException catch (exception) {
      throw AppFailureMapper.map(exception);
    } catch (error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      debugPrint('Error fetching uploaded notes: $error');

      throw const AppFailure(
        message: 'Something went wrong. Please try again.',
        retryable: true,
      );
    }
  }

  Future<void> getNoteStatusStats() async {
    if (!mounted ||
        (state.isLoading && state.loadingAction == UploadLoadingAction.stats)) {
      return;
    }

    try {
      state = state.copyWith(
        isLoading: true,
        loadingAction: UploadLoadingAction.stats,
        error: null,
      );
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

  @override
  void dispose() {
    _cancelToken?.cancel();
    _pagingController.dispose();
    super.dispose();
  }
}
