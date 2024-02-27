import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({Key? key, required this.place}) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(
        children: [ /// Starting with the botom most widget...
          Image.file(place.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,)
        ],
      ),
    );
  }
}
