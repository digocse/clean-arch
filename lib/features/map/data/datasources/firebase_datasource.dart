import '../../data/datasources/datasources.dart';
import '../../data/models/models.dart';

abstract class FirebaseDataSource {
  Stream<List<GalleryModel>> getGalleries();
}

class FirebaseDataSourceImp implements FirebaseDataSource {
  final FirebaseClient firebaseClient;

  FirebaseDataSourceImp({required this.firebaseClient});

  @override
  Stream<List<GalleryModel>> getGalleries() {
    return firebaseClient.requestGalleries();
  }
}
