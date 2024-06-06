import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:calculator/settings_provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});


  final List<String> languageList = [
    "English",
    "عربى",
  ];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var vm = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            local.language,
            style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF298F5E)),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<String>(
            items: languageList,
            initialItem: vm.currentLanguage == "en" ? "English" : "عربى",
            onChanged: (value) {
              if (value == "English") {
                vm.changeLanguage("en");
              } else if (value == "عربى") {
                vm.changeLanguage("ar");
              }
            },
          ),

        ],
      ),
    );
  }
}
