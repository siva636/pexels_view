part of 'media_bloc.dart';

@immutable
class MediaState {
  final ViewState viewState;
  final List<Photo> searchResults;

  const MediaState({
    required this.viewState,
    required this.searchResults,
  });

  const MediaState.initial()
      : this(
          viewState: ViewState.idle,
          searchResults: const [],
        );

  const MediaState.loading()
      : this(
          viewState: ViewState.busy,
          searchResults: const [],
        );
}
