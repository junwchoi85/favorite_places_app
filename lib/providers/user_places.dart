import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import 'package:favorite_places_app/models/place.dart';

Future<Database> _getDatabase() async {
  /// access the local DB
  final dbPath = await sql.getDatabasesPath(); // get the path to the DB.
  final db = await sql.openDatabase(path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, loc_lat REAL, loc_lng REAL, address TEXT)');
  }, version: 1);
  return db;
}

/// The State managed by riverpod must not be mutated.
/// You must not edit it in memory.
/// Instead, if you want to add somthing to it,
/// you should create a new state object.
class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []); // pass initial state to super.

  void loadPlaces() async {
    final db = await _getDatabase();

    final data = await db.query('user_places');
    final places = data
        .map((row) => Place(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String),
            location: PlaceLocation(
                latitude: row['loc_lat'] as double,
                longitude: row['loc_lng'] as double,
                address: row['address'] as String)))
        .toList();

    state = places;
  }

  void addPlace(String title, File image, PlaceLocation location) async {
    /// Copy the image to the app's directory.
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');

    final newPlace =
        Place(title: title, image: copiedImage, location: location);
    final db = await _getDatabase();
    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lng': newPlace.location.longitude,
      'address': newPlace.location.address,
    });

    /// Set the state of the notifier to a new state.
    state = [newPlace, ...state];
  }
}

/// Telling Dart that this will return a new instance of UserPlacesNotifier.
final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
