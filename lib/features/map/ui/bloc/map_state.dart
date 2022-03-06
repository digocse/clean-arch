import 'package:clean_arch/features/map/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MapState extends Equatable {
  @override
  List<Object> get props => [];
}

class MapLoadingState extends MapState {}

class MapGalleriesLoadedState extends MapState {
  final List<Gallery> galleries;

  MapGalleriesLoadedState({required this.galleries});

  @override
  List<Object> get props => [galleries];
}
