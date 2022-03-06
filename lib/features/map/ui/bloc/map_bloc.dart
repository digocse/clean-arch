import './bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapLoadingState());
}
