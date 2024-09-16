import 'package:flutter/material.dart';
import 'package:islamiapp/pages/hadeth/hadeth_details_screen.dart';
import 'package:islamiapp/pages/hadeth/hadeth_tab.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config.dart';
import '../../style/my_theme_app.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;

  ItemHadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        style: provider.isDarkMode()
            ? MyThemeApp.darkTheme.textTheme.bodyMedium
            : MyThemeApp.lightTheme.textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
