import 'package:calculator/views/settin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int currentIndex = 0;
List<Widget> screens = [
  const LayoutView(),
  SettingView(),
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var  lang = AppLocalizations.of(context)!;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items:  [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: lang.home),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: lang.settings),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
