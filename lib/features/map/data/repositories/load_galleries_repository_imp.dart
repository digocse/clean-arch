import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../data/datasources/datasources.dart';

class LoadGalleriesRepositoryImp implements LoadGalleriesRepository {
  final FirebaseDataSource firebaseDataSource;

  LoadGalleriesRepositoryImp({required this.firebaseDataSource});

  @override
  Stream<List<Gallery>> getGalleries() async* {
    yield* firebaseDataSource.getGalleries();
  }
}
