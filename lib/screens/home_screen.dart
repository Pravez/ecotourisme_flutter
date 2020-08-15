import 'package:dev/models/app_state.dart';
import 'package:dev/screens/journey/list/journeys_screen.dart';
import 'package:dev/screens/map_screen.dart';
import 'package:dev/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/eco_dock.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Consumer<AppState>(
        builder: (ctx, state, child) {
          switch(state.state) {
            case MenuState.JOURNEYS:
              return JourneysScreen();
            case MenuState.MAP:
              return MapScreen();
            case MenuState.PROFILE:
              return ProfileScreen();
          }
          throw Error();
        },
      ),
      bottomNavigationBar: EcoDock(),
    );
  }
}
