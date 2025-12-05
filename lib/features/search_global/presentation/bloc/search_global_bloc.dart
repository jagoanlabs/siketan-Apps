import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/features/search_global/domain/model/search_global_response_model.dart';
import 'package:siketan/features/search_global/domain/repository/search_global_repository.dart';

part 'search_global_event.dart';
part 'search_global_state.dart';

class SearchGlobalBloc extends Bloc<SearchGlobalEvent, SearchGlobalState> {
  final SearchGlobalRepository searchGlobalRepository;
  SearchGlobalBloc({required this.searchGlobalRepository})
    : super(const SearchGlobalState()) {
    on<SearchGlobalEvent>((event, emit) {});
    on<SearchGlobalStarted>(_onStarted);
    on<SearchGlobalQueryChanged>(_onQueryChanged);
    on<SearchGlobalFilterChanged>(_onFilterChanged);
    on<SearchGlobalLoadMore>(_onLoadMore);
  }

  Future<void> _onStarted(
    SearchGlobalStarted event,
    Emitter<SearchGlobalState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, query: event.query, currentPage: 1, errorMessage: null));

    try {
      final res = await searchGlobalRepository.searchGlobal(
        query: event.query,
        sortBy: "relevance",
        page: 1,
        limit: 20,
      );

      emit(
        state.copyWith(
          isLoading: false,
          result: res,
          hasReachedEnd: res.pagination?.to == res.pagination?.totalResults,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: handleAppError(e), // Using the error handler you created
        ),
      );
    }
  }

  Future<void> _onQueryChanged(
    SearchGlobalQueryChanged event,
    Emitter<SearchGlobalState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, query: event.query, currentPage: 1, errorMessage: null));

    try {
      final res = await searchGlobalRepository.searchGlobal(
        query: event.query,
        type: state.selectedType,
        page: 1,
        limit: 20,
      );

      emit(
        state.copyWith(
          isLoading: false,
          result: res,
          hasReachedEnd: res.pagination?.to == res.pagination?.totalResults,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: handleAppError(e), // Using the error handler you created
        ),
      );
    }
  }

  Future<void> _onFilterChanged(
    SearchGlobalFilterChanged event,
    Emitter<SearchGlobalState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, selectedType: event.type, currentPage: 1, errorMessage: null),
    );

    try {
      final res = await searchGlobalRepository.searchGlobal(
        query: state.query,
        type: event.type,
        page: 1,
        limit: 20,
      );

      emit(
        state.copyWith(
          isLoading: false,
          result: res,
          hasReachedEnd: res.pagination?.to == res.pagination?.totalResults,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: handleAppError(e), // Using the error handler you created
        ),
      );
    }
  }

  Future<void> _onLoadMore(
    SearchGlobalLoadMore event,
    Emitter<SearchGlobalState> emit,
  ) async {
    if (state.hasReachedEnd || state.isLoadMore) return;

    emit(state.copyWith(isLoadMore: true, errorMessage: null));

    try {
      final nextPage = state.currentPage + 1;

      final res = await searchGlobalRepository.searchGlobal(
        query: state.query,
        type: state.selectedType,
        page: nextPage,
        limit: 20,
      );

      // Gabungkan pagination
      final merged = _mergeResult(state.result!, res);

      emit(
        state.copyWith(
          isLoadMore: false,
          currentPage: nextPage,
          result: merged,
          hasReachedEnd: merged.pagination?.to == merged.pagination?.totalResults,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadMore: false,
          errorMessage: handleAppError(e), // Using the error handler you created
        ),
      );
    }
  }

  SearchGlobalResponseModel _mergeResult(
    SearchGlobalResponseModel oldData,
    SearchGlobalResponseModel newData,
  ) {
    // hanya merge bagian allResults (untuk load more)
    final oldItems = oldData.allResults?.items ?? [];
    final newItems = newData.allResults?.items ?? [];

    final mergedItems = [...oldItems, ...newItems];

    return oldData.copyWith(
      allResults: AllResults(
        items: mergedItems,
        total: newData.allResults?.total,
        showing: mergedItems.length,
      ),
      pagination: newData.pagination,
    );
  }
}
