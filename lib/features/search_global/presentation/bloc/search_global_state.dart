part of 'search_global_bloc.dart';

class SearchGlobalState extends Equatable {
  final bool isLoading;
  final bool isLoadMore;
  final bool hasReachedEnd;
  final String query;
  final String? selectedType; // null = semua
  final int currentPage;

  final SearchGlobalResponseModel? result;
  final String? errorMessage;

  const SearchGlobalState({
    this.isLoading = false,
    this.isLoadMore = false,
    this.hasReachedEnd = false,
    this.query = "",
    this.selectedType,
    this.currentPage = 1,
    this.result,
    this.errorMessage,
  });

  SearchGlobalState copyWith({
    bool? isLoading,
    bool? isLoadMore,
    bool? hasReachedEnd,
    String? query,
    String? selectedType,
    int? currentPage,
    SearchGlobalResponseModel? result,
    String? errorMessage,
  }) {
    return SearchGlobalState(
      isLoading: isLoading ?? this.isLoading,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      query: query ?? this.query,
      selectedType: selectedType ?? this.selectedType,
      currentPage: currentPage ?? this.currentPage,
      result: result ?? this.result,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isLoadMore,
    hasReachedEnd,
    query,
    selectedType,
    currentPage,
    result,
    errorMessage,
  ];
}
