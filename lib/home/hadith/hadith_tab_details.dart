import 'package:flutter/material.dart';
import 'package:islamic_app/home/models/hadith_model.dart';

import 'hadith_details_screen.dart';

class HadithTabDeteils extends StatelessWidget {
  HadithTabDeteils({super.key, required this.hadith});

  HadithModel hadith;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadithDetailsScreen.routeName, arguments: hadith);
      },
      child: Text(
        hadith.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
