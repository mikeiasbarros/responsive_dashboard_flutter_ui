import 'package:flutter/material.dart';
import 'package:store/app_bar/app_bar_widget.dart';
import 'package:store/drawer/drawer_page.dart';
import 'package:store/panel_center/panel_center_page.dart';
import 'package:store/panel_left/panel_left_page.dart';
import 'package:store/panel_right/panel_right_page.dart';
import 'package:store/responsive_layout.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : const AppBarWidget()),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: const PanelCenter(),
        largeTablet: const Row(
          children: [
            Expanded(child: PanelLeft()),
            Expanded(child: PanelCenter()),
            Expanded(
              child: PanelRight(),
            )
          ],
        ),
        tablet: const Row(
          children: [
            Expanded(child: PanelLeft()),
            Expanded(child: PanelCenter()),
          ],
        ),
        computer: const Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeft()),
            Expanded(child: PanelCenter()),
            Expanded(
              child: PanelRight(),
            )
          ],
        ),
      ),
    );
  }
}
