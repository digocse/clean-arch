import '../entities/entities.dart';

abstract class LoadGalleries {
  Future<List<GalleryEntity>> getGalleries();
}
