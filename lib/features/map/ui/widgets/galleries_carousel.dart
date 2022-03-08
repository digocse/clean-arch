import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

class GalleriesCarousel extends StatelessWidget {
  final List<Gallery> galleries;
  final Completer<GoogleMapController> mapController;

  GalleriesCarousel({required this.galleries, required this.mapController}) : super();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: galleries.length,
            itemBuilder: (builder, index) {
              return SizedBox(
                width: 240,
                child: Card(
                  color: Colors.blue[900],
                  child: Center(
                    child: ListTile(
                      title: Text(
                        /// Retrieving first store inside a gallery for simplicity.
                        /// This way we skip gathering each store data step.
                        galleries[index].storesIdsList.first,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        galleries[index].id,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      onTap: () async {
                        final controller = await mapController.future;
                        await controller.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(
                                galleries[index].latLngCoordinates.latitude,
                                galleries[index].latLngCoordinates.longitude,
                              ),
                              zoom: 16,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
