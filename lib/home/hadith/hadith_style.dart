import 'package:flutter/material.dart';

class HadithStyle extends StatelessWidget {
  HadithStyle({super.key, required this.content});

  String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      content,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
