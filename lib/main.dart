import 'package:dev/models/app_state.dart';
import 'package:dev/screens/home_screen.dart';
import 'package:dev/screens/journey/detail/journey_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (ctx) => AppState(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EcoFluttrisme',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {'/': (ctx) => HomeScreen(), '/details': (ctx) => JourneyDetailsScreen()});
  }
}
