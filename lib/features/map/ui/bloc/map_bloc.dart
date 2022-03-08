import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc.dart';

import '../../domain/entities/entities.dart';
import '../../../core/domain/usecases/usecases.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final UseCase<List<Gallery>, void> loadGalleriesUseCase;

  MapBloc({required UseCase<List<Gallery>, void> galleries})
      : loadGalleriesUseCase = galleries,
        super(MapLoadingState()) {
    on<GetGalleriesEvent>(_getGalleries);
    on<GalleriesUpdated>(_galleriesUpdated);
    add(GetGalleriesEvent());
  }

  Future<void> _getGalleries(GetGalleriesEvent event, Emitter<MapState> emit) async {
    await emit.forEach(loadGalleriesUseCase.callStream(null), onData: (List<Gallery> galleriesList) {
      return MapGalleriesLoadedState(galleries: galleriesList);
    });
  }

  Stream<MapState> _galleriesUpdated(GalleriesUpdated event, Emitter<MapState> emitter) async* {
    yield MapGalleriesLoadedState(galleries: event.galleries);
  }
}
