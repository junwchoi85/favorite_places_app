import 'package:favorite_places_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The State managed by riverpod must not be mutated.
/// You must not edit it in memory.
/// Instead, if you want to add somthing to it,
/// you should create a new state object.
class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []); // pass initial state to super.

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state];
  }
}

/// Telling Dart that this will return a new instance of UserPlacesNotifier.
final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
