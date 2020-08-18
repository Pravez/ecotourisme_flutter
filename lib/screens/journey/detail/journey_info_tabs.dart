import 'package:dev/models/dtos/journey.dart';
import 'package:flutter/material.dart';

class JourneyInfoTabs extends StatefulWidget {
  final Journey journey;

  const JourneyInfoTabs({Key key, this.journey}) : super(key: key);

  @override
  _JourneyInfoTabsState createState() => _JourneyInfoTabsState();
}

class _JourneyInfoTabsState extends State<JourneyInfoTabs> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final tabs = ["Description", "Infos", "Ecotourisme", "Y aller"].map((e) => Tab(text: e)).toList();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: TabBar(
          labelPadding: EdgeInsets.zero,
          indicatorColor: _getCategoryColor(widget.journey.category),
          labelColor: Color(0xFF2c2c2c),
          labelStyle: TextStyle(fontSize: 13, letterSpacing: -0.19),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      /*Flexible(
        fit: FlexFit.loose,
        child: TabBarView(
          controller: _tabController,
          children: [
            Text(widget.journey.description.fr),
            Text(widget.journey.description.fr),
            Text(widget.journey.description.fr),
            Text(widget.journey.description.fr)
          ],
        ),
      )*/
    ]);
  }

  _getCategoryColor(String category) {
    switch (category) {
      case "nature":
        return Color.fromARGB(255, 76, 182, 88);
      case "history":
        return Color.fromARGB(255, 255, 196, 38);
      case "water":
        return Color.fromARGB(255, 60, 146, 230);
    }
  }
}
