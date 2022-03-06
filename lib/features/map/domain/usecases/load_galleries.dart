import 'package:clean_arch/features/core/domain/usecases/usecase.dart';

import '../repositories/repositories.dart';
import '../entities/entities.dart';

class LoadGalleries extends UseCase<List<Gallery>, void> {
  final LoadGalleriesRepository loadGalleriesRepo;

  LoadGalleries({required this.loadGalleriesRepo});

  @override
  Stream<List<Gallery>> callStream(void params) async* {
    yield* loadGalleriesRepo.getGalleries();
  }

  @override
  Future<List<Gallery>> call(void params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
