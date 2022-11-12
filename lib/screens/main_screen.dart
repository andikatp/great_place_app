import 'package:flutter/material.dart';
import 'package:greate_place_app/screens/add_place_screen.dart';

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
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
