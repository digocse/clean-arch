import 'package:clean_arch/features/map/data/datasources/datasources.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseDataSourceSpy extends Mock implements FirebaseDataSource {
  FirebaseDataSourceSpy() {
    mockGetGalleries();
  }

  When mockGetGalleriesCall() => when(() => getGalleries());
  void mockGetGalleries() => mockGetGalleriesCall().thenAnswer((_) async => _);
}
