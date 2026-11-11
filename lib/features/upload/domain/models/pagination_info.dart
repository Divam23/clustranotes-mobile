class PaginationInfo {
  final int page;
  final int limit;
  final int totalResults;
  final int totalPages;

  const PaginationInfo({
    this.page = 1,
    this.limit = 15,
    required this.totalResults,
    required this.totalPages,
  });
}
