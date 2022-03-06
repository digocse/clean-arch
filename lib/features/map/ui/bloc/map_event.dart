import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

// @immutable
abstract class MapEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetGalleriesEvent extends MapEvent {
  GetGalleriesEvent();
}

class GalleriesUpdated extends MapEvent {
  final List<Gallery> galleries;

  GalleriesUpdated(this.galleries);
}
