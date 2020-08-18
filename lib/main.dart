import 'package:dev/models/app_state.dart';
import 'package:dev/screens/home_screen.dart';
import 'package:dev/screens/journey/detail/journey_details_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (ctx) => AppState(),
      child: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("Unable to initialize firebase"),);
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )));
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
        routes: {
          '/': (ctx) => HomeScreen(),
          '/details': (ctx) => JourneyDetailsScreen()
        });
  }
}
