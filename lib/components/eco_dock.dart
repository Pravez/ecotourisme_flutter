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
    StateItem(MenuState.JOURNEYS, "Liste", Icons.list),
    StateItem(MenuState.MAP, "Carte", Icons.map),
    StateItem(MenuState.PROFILE, "Profil", Icons.person)
  ];
  int _currentStateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(26.5), topRight: Radius.circular(26.5)),
      child: Container(
        height: 75,
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(
              decorationColor: Colors.black, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(
              decorationColor: Colors.black.withOpacity(0.4),
              fontWeight: FontWeight.w600),
          selectedIconTheme: IconThemeData(color: Color(0xFF76d798)),
          unselectedIconTheme: IconThemeData(color: Color(0XFFDCDCDC)),
          currentIndex: _currentStateIndex,
          onTap: (index) {
            Provider.of<AppState>(context, listen: false)
                .changeState(_menuStates[index].state);
            this.setState(() {
              _currentStateIndex = index;
            });
          },
          type: BottomNavigationBarType.shifting,
          items: _buildItems(),
        ),
      ),
    );
  }

  _buildItems() {
    return _menuStates
        .map((e) => BottomNavigationBarItem(
              icon: Icon(e.icon),
              label: e.title,
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
