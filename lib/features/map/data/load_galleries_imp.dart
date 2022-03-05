import 'data.dart';

class LoadGalleriesImp {
  final FirebaseClient firebaseClient;
  final String url;

  LoadGalleriesImp({required this.firebaseClient, required this.url});

  Future<void> getGalleries() async {
    await firebaseClient.request(url: url);
  }
}
