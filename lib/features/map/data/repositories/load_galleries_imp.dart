import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../data/datasources/datasources.dart';

class LoadGalleriesImp implements LoadGalleriesRepository {
  final FirebaseClient firebaseClient;
  final FirebaseDataSource firebaseDataSource;

  final String url;

  LoadGalleriesImp({required this.firebaseClient, required this.firebaseDataSource, required this.url});

  @override
  Stream<List<Gallery>> getGalleries() async* {
    yield* firebaseDataSource.getGalleries();
  }
}
