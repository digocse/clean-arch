import '../repositories/repositories.dart';
import '../entities/entities.dart';

class LoadGalleries {
  final LoadGalleriesRepository loadGalleriesRepo;

  LoadGalleries({required this.loadGalleriesRepo});

  Stream<List<Gallery>> call() {
    return loadGalleriesRepo.getGalleries();
  }
}
