import '../entities/entities.dart';

abstract class LoadGalleriesRepository {
  Stream<List<Gallery>> getGalleries();
}
