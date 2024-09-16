import 'package:flutter/cupertino.dart';
import 'package:islamiapp/style/my_theme_app.dart';
import 'package:provider/provider.dart';

import '../providers/app_config.dart';

class ItemHadeth extends StatelessWidget {
  String content;

  ItemHadeth({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      content,
      style: provider.isDarkMode()
          ? MyThemeApp.darkTheme.textTheme.headlineMedium
          : MyThemeApp.lightTheme.textTheme.headlineMedium,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
