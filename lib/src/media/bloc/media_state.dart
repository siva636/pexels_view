part of 'media_bloc.dart';

@immutable
class MediaState extends Equatable {
  final ViewState viewState;
  final Map<int, ItemsPage> pages;
  final String? query;
  final int? itemCount;
  final Photo? photo;

  const MediaState({
    required this.viewState,
    required this.pages,
    this.query,
    this.itemCount,
    this.photo,
  });

  MediaState.initial()
      : this(
          viewState: ViewState.busy,
          pages: {},
        );

  MediaState loading() {
    return copyWith(viewState: ViewState.busy);
  }

  MediaState copyWith({
    ViewState? viewState,
    String? query,
    int? itemCount,
    Map<int, ItemsPage>? pages,
    Photo? photo,
  }) {
    return MediaState(
      viewState: viewState ?? this.viewState,
      pages: pages ?? this.pages,
      query: query ?? this.query,
      itemCount: itemCount ?? this.itemCount,
      photo: photo ?? this.photo,
    );
  }

  Photo? getByIndex(int index) {
    var pageNumber = (index ~/ itemsPerPage) + 1;

    if (pages.containsKey(pageNumber)) {
      var item =
          pages[pageNumber]!.items[index - (pageNumber - 1) * itemsPerPage];
      return item;
    }

    return null;
  }

  @override
  List<Object?> get props => [viewState, pages, itemCount, query, photo];
}
