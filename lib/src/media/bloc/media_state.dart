part of 'media_bloc.dart';

@immutable
abstract class MediaState {
  abstract final ViewState viewState;
  abstract final List<Photo> searchResults;
}

class MediaStateImpl extends MediaState {
  ViewState viewStateImpl;
  List<Photo> searchResultsImpl;

  @override
  List<Photo> get searchResults => searchResultsImpl;

  @override
  ViewState get viewState => viewStateImpl;

  MediaStateImpl(
      {required this.viewStateImpl, required this.searchResultsImpl});
  MediaStateImpl.initial()
      : this(
          viewStateImpl: ViewState.idle,
          searchResultsImpl: const [],
        );
  MediaStateImpl.loading()
      : this(
          viewStateImpl: ViewState.busy,
          searchResultsImpl: const [],
        );
}
