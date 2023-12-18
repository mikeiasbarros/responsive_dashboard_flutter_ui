import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/components/constants.dart';
import 'package:store/responsive_layout.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class Buttons {
  String title;
  IconData icon;
  Buttons({required this.icon, required this.title});
}

int _currentIndex = 0;

List<Buttons> _namesOfButtons = [
  Buttons(icon: Icons.home_outlined, title: 'Home'),
  Buttons(icon: Icons.admin_panel_settings_outlined, title: 'Administração'),
  Buttons(icon: Icons.monetization_on_outlined, title: 'Receitas da empresa'),
  Buttons(icon: Icons.people_outline, title: 'Funcionários')
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Constants.kDeepBlue,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
          child: Column(children: [
            ListTile(
              title: Text(
                'Admin menu',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
              trailing: ResponsiveLayout.isComputer(context)
                  ? null
                  : IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
            ),
            ...List.generate(
                _namesOfButtons.length,
                (index) => Column(
                      children: [
                        Container(
                          decoration: index == _currentIndex
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(colors: [
                                    Constants.kCleanColorBege.withOpacity(.9),
                                    Constants.kDarkGreen.withOpacity(.9)
                                  ]))
                              : null,
                          child: ListTile(
                            title: Text(
                              _namesOfButtons[index].title,
                              style:  GoogleFonts.roboto(
                                color: Colors.white,
                              ),
                            ),
                            leading: Padding(
                                padding: const EdgeInsets.all(Constants.kPadding),
                                child: Icon(
                                  _namesOfButtons[index].icon,
                                  color: Colors.white,
                                )),
                            onTap: () {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: .1,
                        )
                      ],
                    ))
          ]),
        ),
      ),
    );
  }
}
