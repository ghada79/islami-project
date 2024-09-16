import 'package:flutter/material.dart';
import 'package:islamiapp/pages/quran/sura_details_screen.dart';
import 'package:provider/provider.dart';

import '../providers/app_config.dart';
import '../style/my_theme_app.dart';

class ItemSuraName extends StatelessWidget {
  String suraList;
  int index;

  ItemSuraName({required this.suraList, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: suraList, index: index));
      },
      child: Text(
        suraList,
        style: provider.isDarkMode()
            ? MyThemeApp.darkTheme.textTheme.bodyMedium
            : MyThemeApp.lightTheme.textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
