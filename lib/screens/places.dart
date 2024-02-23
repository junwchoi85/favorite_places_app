import 'package:favorite_places_app/screens/add_place.dart';
import 'package:favorite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  // Constructor
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddPlaceScreen()));
            },
          ),
        ],
      ),
      body: PlacesList(place: []),
    );
  }
}
