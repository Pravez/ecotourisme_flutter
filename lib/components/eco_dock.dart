import 'package:dev/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EcoDock extends StatefulWidget {
  EcoDock({Key key}) : super(key: key);

  @override
  _EcoDockState createState() => _EcoDockState();
}

class _EcoDockState extends State<EcoDock> with SingleTickerProviderStateMixin {
  final _menuStates = [
    StateItem(MenuState.JOURNEYS, "Journeys", Icons.list),
    StateItem(MenuState.MAP, "Map", Icons.map),
    StateItem(MenuState.PROFILE, "Profile", Icons.person)
  ];
  int _currentStateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: BottomNavigationBar(
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black26,
            currentIndex: _currentStateIndex,
            onTap: (index) {
              Provider.of<AppState>(context, listen: false)
                  .changeState(_menuStates[index].state);
              this.setState(() {
                _currentStateIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: _buildItems(),
          ),
    );
  }

  _buildItems() {
    return _menuStates
        .map((e) => BottomNavigationBarItem(
              icon: Icon(e.icon),
              title: Text(e.title),
            ))
        .toList();
  }
}

class StateItem {
  final MenuState state;
  final String title;
  final IconData icon;

  StateItem(this.state, this.title, this.icon);
}
