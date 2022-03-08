import '../../domain/entities/entities.dart';

abstract class MapEvent {}

class GetGalleriesEvent extends MapEvent {
  GetGalleriesEvent();
}

class GalleriesUpdated extends MapEvent {
  final List<Gallery> galleries;

  GalleriesUpdated(this.galleries);
}
