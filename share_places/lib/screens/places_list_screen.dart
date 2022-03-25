import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_places/providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  // const PlacesListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('add-place');
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatePlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatePlaces>(
                child: Center(
                  child: const Text('Not places yet, start adding some!'),
                ),
                builder: (ctx, greatPlaces, ch) =>
                    greatPlaces.getItems.length <= 0
                        ? ch
                        : ListView.builder(
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.getItems[i].image),
                              ),
                              title: Text(greatPlaces.getItems[i].title),
                              onTap: () {},
                            ),
                            itemCount: greatPlaces.getItems.length,
                          ),
              ),
      ),
    );
  }
}
