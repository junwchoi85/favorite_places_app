import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {super.key,
      this.location = const PlaceLocation(
          latitude: 37.422,
          longitude: -122.084,
          address: 'GooglePlex, Mountain View, CA, USA'),
      this.isSelecting = true});

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick Your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                Navigator.of(context).pop(_pickedLocation);
              },
            ),
        ],
      ),
      body: GoogleMap(
          onTap: !widget.isSelecting ? null : (position) {
            setState(() {
              _pickedLocation = position;
            });
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.location.latitude, widget.location.longitude),
            zoom: 16,
          ),
          markers: (_pickedLocation == null && widget.isSelecting) ? {} : {
            /// Set of markers to be displayed on the map.
            Marker(
              markerId: const MarkerId('m1'),
              position: _pickedLocation ??
                  LatLng(widget.location.latitude, widget.location.longitude),
            ),
          }),
    );
  }
}
