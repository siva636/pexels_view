class ItemsPage<T> {
final int totalResults;
  final int pageNumber;
  final List<T> items;
  final bool hasNext;

  ItemsPage({
    required this.totalResults,
    required this.pageNumber,
    required this.items,
    required this.hasNext,
  });
}
