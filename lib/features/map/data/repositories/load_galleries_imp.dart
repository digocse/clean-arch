import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../data/datasources/datasources.dart';

class LoadGalleriesImp implements LoadGalleriesRepository {
  final FirebaseClient firebaseClient;
  final FirebaseDataSource firebaseDataSource;

  LoadGalleriesImp({required this.firebaseClient, required this.firebaseDataSource});

  @override
  Stream<List<Gallery>> getGalleries() async* {
    yield* firebaseDataSource.getGalleries();
  }
}
