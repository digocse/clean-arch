import 'package:clean_arch/features/map/data/data.dart';
import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocks/mocks.dart';

void main() {
  test('Should call FirebaseClient with correct URL', () async {
    final firebaseClient = FirebaseClientSpy();
    final url = faker.internet.httpsUrl();
    final sut = LoadGalleriesImp(firebaseClient: firebaseClient, url: url);

    await sut.getGalleries();

    verify(() => firebaseClient.request(url: url)).called(1);
  });
}
