import 'package:flutter/material.dart';
import 'package:greate_place_app/providers/great_place_provider.dart';
import 'package:greate_place_app/screens/add_place_screen.dart';
import 'package:greate_place_app/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaceProvider(),
      child: MaterialApp(
        title: 'Great Place',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.indigo,
          secondary: Colors.amber,
        )),
        home: const MainScreen(),
        routes: {
          MainScreen.routeName: (ctx) => const MainScreen(),
          AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen(),
        },
      ),
    );
  }
}
