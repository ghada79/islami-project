import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp/pages/hadeth/hadeth_details_screen.dart';
import 'package:islamiapp/pages/home/homescreen.dart';
import 'package:islamiapp/pages/quran/sura_details_screen.dart';
import 'package:islamiapp/providers/app_config.dart';
import 'package:islamiapp/style/my_theme_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: IslamiApp()));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyThemeApp.lightTheme,
      themeMode: provider.appTheme,
      darkTheme: MyThemeApp.darkTheme,
      initialRoute: Homescreen.routeName,
        routes: {
          Homescreen.routeName: (context) => Homescreen(),
          SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
          HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}