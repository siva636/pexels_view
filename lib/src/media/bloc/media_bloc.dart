import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels_view/src/media/model/photo.dart';
import 'package:pexels_view/src/media/model/items_page.dart';
import 'package:pexels_view/src/media/repository/media_repository.dart';
import 'package:pexels_view/src/utility/constant/constant.dart';
import 'package:pexels_view/src/utility/enum/view_state.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaRepository mediaRepository;
  Set<int> pagesBeingFetched = {};

  MediaBloc(this.mediaRepository) : super(MediaState.initial()) {
    on<FetchPage>((event, emit) async {
      final ItemsPage page;
      int index = event.index;
      var pageNumber = (index ~/ itemsPerPage) + 1;
      String query = event.query;

      if (pagesBeingFetched.contains(pageNumber)) {
        return;
      }

      pagesBeingFetched.add(pageNumber);
      try {
        page = await mediaRepository.fetchPage(
            pageNumber: pageNumber, query: query);
      } catch (e) {
        pagesBeingFetched.remove(pageNumber);
        emit(
          state.copyWith(
            viewState: ViewState.error,
          ),
        );
        return;
      }

      pagesBeingFetched.remove(pageNumber);

      Map<int, ItemsPage> pagesBeforeClearCache = Map.from(state.pages);
      pagesBeforeClearCache[pageNumber] = page;
      Map<int, ItemsPage> pagesAfterClearCache =
          _clearCache(pageNumber, pagesBeforeClearCache);

      emit(
        state.copyWith(
          viewState: ViewState.idle,
          itemCount: page.totalResults,
          pages: pagesAfterClearCache,
          query: query,
        ),
      );
    });

    on<FetchItem>((event, emit) async {
      int id = event.id;
      emit(
        state.copyWith(
          viewState: ViewState.busy,
        ),
      );

      try {
        Photo photo = await mediaRepository.fetchItem(id);
        emit(state.copyWith(
          viewState: ViewState.idle,
          photo: photo,
        ));
      } catch (e) {
        emit(state.copyWith(
          viewState: ViewState.error,
        ));
      }
    });
  }
}

// clear cache
Map<int, ItemsPage> _clearCache(
  int pageNumber,
  Map<int, ItemsPage> pages,
) {
  final keysToRemove = <int>{};
  for (final key in pages.keys) {
    if ((key - pageNumber).abs() > maxCachedPages) {
      keysToRemove.add(key);
    }
  }
  for (final key in keysToRemove) {
    pages.remove(key);
  }

  return pages;
}
