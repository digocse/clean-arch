import 'package:clean_arch/features/map/data/datasources/datasources.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseClientSpy extends Mock implements FirebaseClient {
  FirebaseClientSpy() {
    mockRequest();
  }

  When mockRequestCall() => when(() => any);
  void mockRequest() => mockRequestCall().thenAnswer((_) async => _);
}
