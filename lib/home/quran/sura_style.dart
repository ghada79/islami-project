import 'package:flutter/material.dart';

class SuraStyle extends StatelessWidget {
  SuraStyle({super.key, required this.content, required this.index});

  String content;
  int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      '$content (${index + 1})',
      style: Theme.of(context).textTheme.titleLarge,
      textDirection: TextDirection.rtl,
    );
  }
}
