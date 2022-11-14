import 'package:flutter/material.dart';
import 'package:greate_place_app/providers/great_place_provider.dart';
import 'package:greate_place_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const routeName = 'main-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Place'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.routeName);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaceProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaceProvider>(
                    child: const Center(
                      child: Text('Got no place yet, start adding some!'),
                    ),
                    builder: (ctx, value, ch) => value.items.isEmpty
                        ? ch!
                        : ListView.builder(
                            itemCount: value.items.length,
                            itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(value.items[index].image),
                              ),
                              title: Text(value.items[index].title),
                              onTap: () {
                                //go to the detail page
                              },
                            ),
                          ),
                  ),
      ),
    );
  }
}
