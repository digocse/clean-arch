import 'package:clean_arch/features/map/data/repositories/repositories.dart';
import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocks/firebase_datasource_spy.dart';
import '../mocks/mocks.dart';

void main() {
  late FirebaseClientSpy firebaseClient;
  late FirebaseDataSourceSpy firebaseDataSource;

  setUp(() {
    firebaseClient = FirebaseClientSpy();
    firebaseDataSource = FirebaseDataSourceSpy();
  });
  test('Should call FirebaseClient with correct URL', () async {
    final url = faker.internet.httpsUrl();
    final sut = LoadGalleriesImp(firebaseClient: firebaseClient, url: url, firebaseDataSource: firebaseDataSource);

    sut.getGalleries();

    verify(() => firebaseClient.request(url: url)).called(1);
  });

  test('Should retrieve all galleries', () async {
    final firebaseClient = FirebaseClientSpy();
    final url = faker.internet.httpsUrl();
    final sut = LoadGalleriesImp(firebaseClient: firebaseClient, url: url, firebaseDataSource: firebaseDataSource);

    sut.getGalleries();
  });
}
