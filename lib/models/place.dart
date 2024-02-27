import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

/// A blueprint of the location of a place.
class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;

  Place({
    required this.title, 
    required this.image,
    required this.location
  }) : id = uuid.v4();
}
