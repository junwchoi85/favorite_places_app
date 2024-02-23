import 'package:favorite_places_app/models/place.dart';
import 'package:favorite_places_app/screens/places_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  //constructor.
  const PlacesList({Key? key, required this.place}) : super(key: key);

  final List<Place> place;

  @override
  Widget build(BuildContext context) {
    if (place.isEmpty) {
      return Center(
        child: Text(
          'Got no places yet, start adding some!',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return ListView.builder(
      itemCount: place.length,
      itemBuilder: (ctx, i) => ListTile(
        // leading: CircleAvatar(
        //   backgroundImage: FileImage(place[i].image),
        // ),
        title: Text(place[i].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                )),
        // subtitle: Text(place[i].location.address!),
        onTap: () {
          // Go to detail page ...
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return PlacesDetailScreen(place: place[i]);
            },
          ));
        },
      ),
    );
  }
}
