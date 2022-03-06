import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/entities.dart';
import '../../data/datasources/datasources.dart';

class GalleryModel extends Gallery {
  const GalleryModel({
    required String id,
    required LatLng latLngCoordinates,
    required List<String> storesIdsList,
  }) : super(
          id: id,
          latLngCoordinates: latLngCoordinates,
          storesIdsList: storesIdsList,
        );

  factory GalleryModel.fromDocument(GalleryDocument galleryDocument) {
    return GalleryModel(
      id: galleryDocument.id,
      latLngCoordinates: galleryDocument.latLngCoordinates,
      storesIdsList: galleryDocument.storesIdsList,
    );
  }
}
