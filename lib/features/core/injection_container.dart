import 'package:clean_arch/features/map/data/datasources/clients/firebase_client.dart';
import 'package:clean_arch/features/map/data/datasources/datasources.dart';
import 'package:clean_arch/features/map/data/repositories/load_galleries_repository_imp.dart';
import 'package:clean_arch/features/map/domain/repositories/load_galleries_repository.dart';
import 'package:clean_arch/features/map/domain/usecases/load_galleries.dart';
import 'package:get_it/get_it.dart';

import '../map/ui/bloc/bloc.dart';
import '../map/domain/entities/entities.dart';
import './domain/usecases/usecases.dart';

final sl = GetIt.instance;

Future<void> initInjectionContainer() async {
  sl.registerFactory<MapBloc>(() => MapBloc(galleries: sl<UseCase<List<Gallery>, void>>()));

  sl.registerLazySingleton<FirebaseClient>(() => FirebaseClientImp());
  sl.registerLazySingleton<FirebaseDataSource>(() => FirebaseDataSourceImp(firebaseClient: sl<FirebaseClient>()));

  sl.registerLazySingleton<UseCase<List<Gallery>, void>>(() => LoadGalleries(loadGalleriesRepo: sl<LoadGalleriesRepository>()));
  sl.registerLazySingleton<LoadGalleriesRepository>(
    () => LoadGalleriesRepositoryImp(firebaseDataSource: sl<FirebaseDataSource>()),
  );
}
