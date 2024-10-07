import 'package:flutter/material.dart';
import 'package:islamic_app/home/models/quran_model.dart';
import 'package:islamic_app/home/quran/sura_details_screen.dart';

class QuranTabDeteils extends StatelessWidget {
  QuranTabDeteils({super.key, required this.suraName, required this.index});

  String suraName;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: QuranModel(nameOfSura: suraName, indexOfSura: index));
      },
      child: Text(
        suraName,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
