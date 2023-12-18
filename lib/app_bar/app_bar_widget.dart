import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/components/constants.dart';
import 'package:store/responsive_layout.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.kDeepBlue,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 30,
              ),
            )
          else
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                color: Colors.white,
                iconSize: 30,
                icon: const Icon(Icons.menu)),
          const SizedBox(
            width: Constants.kPadding,
          ),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                onPressed: () {
                  setState(() {
                    _currentSelected = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding * 2),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _buttonNames[index],
                          style: GoogleFonts.roboto(
                              color: _currentSelected == index
                                  ? Colors.white
                                  : Colors.white70),
                        ),
                        Container(
                          margin: const EdgeInsets.all(Constants.kPadding / 2),
                          width: 60,
                          height: 2,
                          decoration: BoxDecoration(
                              gradient: _currentSelected == index
                                  ? const LinearGradient(colors: [
                                      Constants.kCleanColorBege,
                                      Constants.kDarkGreen
                                    ])
                                  : null),
                        ),
                      ]),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _buttonNames[_currentSelected],
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(Constants.kPadding / 2),
                      width: 60,
                      height: 2,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Constants.kCleanColorBege,
                        Constants.kDarkGreen
                      ])),
                    )
                  ]),
            ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            color: Colors.white,
            iconSize: 30,
            icon: const Icon(Icons.search),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                color: Colors.white,
                iconSize: 30,
                icon: const Icon(Icons.notifications_none_outlined),
              ),
              const Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    radius: 8,
                  ))
            ],
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10)
              ], shape: BoxShape.circle),
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.pink,
              ),
            ),
        ],
      ),
    );
  }
}

List<String> _buttonNames = ['Overview', 'Revenue', 'Sales', 'Control'];
int _currentSelected = 0;
