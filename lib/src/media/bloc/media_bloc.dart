import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels_view/src/media/model/photo.dart';
import 'package:pexels_view/src/media/repository/media_repository.dart';
import 'package:pexels_view/src/utility/enum/view_state.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaRepository mediaRepository;
  MediaBloc(this.mediaRepository) : super(const MediaState.initial()) {
    on<MediaSearch>((event, emit) async {
      try {
        emit(
          const MediaState.loading(),
        );
        List<Photo> photos = await mediaRepository.fetchPhotos(event.query);
        emit(
          MediaState(viewState: ViewState.idle, searchResults: photos),
        );
      } catch (e) {
        emit(
          MediaState(
            viewState: ViewState.error,
            searchResults: state.searchResults,
          ),
        );
      }
    });
  }
}
