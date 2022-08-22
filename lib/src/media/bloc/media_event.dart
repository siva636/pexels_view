part of 'media_bloc.dart';

@immutable
abstract class MediaEvent {}

class MediaSearch extends MediaEvent {
  String query;
  MediaSearch(this.query);
}
