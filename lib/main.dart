import 'package:calculator/settings_provider/settings_provider.dart';
import 'package:calculator/views/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    var vm = Provider.of<SettingsProvider>(context);

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tippy Calculator',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: const Color(0xFF298F5E),
            selectedLabelStyle: GoogleFonts.roboto(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            unselectedItemColor: const Color(0xFF9EA1A1),
            unselectedLabelStyle: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
        primaryColor: Colors.green,
      ),
      themeMode: ThemeMode.light,
      locale: Locale(vm.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      supportedLocales: AppLocalizations.supportedLocales,
      // const [
      //   Locale('en'), // English
      //   Locale('es'), // Spanish
      // ],
      home: const Home(),
    );
  }
}
