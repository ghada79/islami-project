import 'package:flutter/cupertino.dart';
import 'package:islamiapp/style/my_theme_app.dart';

class ItemSura extends StatelessWidget {
  String content;

  int index;

  ItemSura({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$content(${index + 1})',
      style: MyThemeApp.lightTheme.textTheme.bodyMedium,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
