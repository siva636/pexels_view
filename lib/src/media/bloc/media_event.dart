part of 'media_bloc.dart';

@immutable
abstract class MediaEvent {}

class FetchPage extends MediaEvent {
  final int index;
  final String query;
  FetchPage({required this.index, required this.query});
}

class FetchItem extends MediaEvent {
  final int id;
  FetchItem({required this.id});
}
