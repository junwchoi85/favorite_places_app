import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

import 'package:favorite_places_app/models/place.dart';

/// The State managed by riverpod must not be mutated.
/// You must not edit it in memory.
/// Instead, if you want to add somthing to it,
/// you should create a new state object.
class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []); // pass initial state to super.

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');

    final newPlace = Place(title: title, image: copiedImage, location: location);
    state = [newPlace, ...state];
  }
}

/// Telling Dart that this will return a new instance of UserPlacesNotifier.
final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
