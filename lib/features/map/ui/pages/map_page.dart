import 'dart:async';

import 'package:clean_arch/features/core/injection_container.dart';
import 'package:clean_arch/features/map/ui/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  static const String id = '/map';

  MapPage({Key? key}) : super(key: key) {
    sl.get<MapBloc>().add(GetGalleriesEvent());
  }

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.blue, size: 40.0),
      ),
      body: BlocBuilder<MapBloc, MapState>(
        bloc: sl.get<MapBloc>(),
        builder: (context, state) {
          if (state is MapLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MapGalleriesLoadedState) {
            return Stack(
              children: <Widget>[
                GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(-23.586289, -46.681886),
                      zoom: 17.55,
                    ),
                    onMapCreated: (GoogleMapController controller) async {
                      _controller.complete(controller);
                      // _centralizeOnUserPosition();
                    },
                    myLocationButtonEnabled: false,
                    markers: state.galleries
                        .map(
                          (document) => Marker(
                            markerId: MarkerId(document.id),
                            // icon: const Icon(Icons.directions_boat),
                            position: LatLng(
                              document.latLngCoordinates.latitude,
                              document.latLngCoordinates.longitude,
                            ),
                            onTap: () {
                              // Navigator.pushNamed(context, GalleryScreen.id, arguments: {
                              //   'galleryId': document.id,
                              // });
                            },
                          ),
                        )
                        .toSet()),
                // SafeArea(
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: GalleriesCarousel(
                //       documents: galleriesDocs!,
                //       mapController: _controller,
                //     ),
                //   ),
                // ),
              ],
            );
          }

          return const Text('Couldn\'t retrieve galleries.');
        },
      ),
    );
  }
}
