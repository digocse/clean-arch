import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Gallery extends Equatable {
  final String id;
  final LatLng latLngCoordinates;
  final List<String> storesIdsList;

  const Gallery({required this.id, required this.latLngCoordinates, required this.storesIdsList});

  @override
  List<Object?> get props => [id, latLngCoordinates, storesIdsList];
}
