import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/models.dart';
import '../../../domain/entities/entities.dart';

abstract class FirebaseClient {
  Stream<List<GalleryModel>> requestGalleries();
}

class FirebaseClientImp implements FirebaseClient {
  @override
  Stream<List<GalleryModel>> requestGalleries() {
    return FirebaseFirestore.instance.collection('galleries').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => GalleryModel.fromDocument(GalleryDocument.fromDataSource(doc))).toList();
    });
  }
}

class GalleryDocument extends Gallery {
  const GalleryDocument({
    required String id,
    required LatLng latLngCoordinates,
    required List<String> storesIdList,
  }) : super(
          id: id,
          latLngCoordinates: latLngCoordinates,
          storesIdsList: storesIdList,
        );

  factory GalleryDocument.fromDataSource(DocumentSnapshot galleryDoc) {
    final galleryDataMap = galleryDoc.data() as Map;
    final GeoPoint geoPoint = galleryDataMap['latLngCoordinates'];

    return GalleryDocument(
      id: galleryDataMap['id'],
      latLngCoordinates: LatLng(geoPoint.latitude, geoPoint.longitude),
      storesIdList: List<String>.from(galleryDataMap['stores']),
    );
  }
}
