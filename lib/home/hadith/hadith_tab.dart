import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_colors.dart';
import '../models/hadith_model.dart';
import 'hadith_tab_details.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> ahadithList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadithList.isEmpty) {
      loadFile();
    }
    return Column(
      children: [
        Expanded(child: Image.asset('assets/images/tabs/hadith.png')),
        const Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(AppLocalizations.of(context)!.hadith),
            ],
          ),
        ),
        const Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ahadithList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return Center(
                        child: HadithTabDeteils(
                      hadith: ahadithList[index],
                    ));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: AppColors.primaryLightColor,
                      thickness: 3,
                      indent: 100,
                      endIndent: 100,
                    );
                  },
                  itemCount: ahadithList.length),
        )
      ],
    );
  }

  void loadFile() async {
    String hadithcontent =
        await rootBundle.loadString('assets/files/hadith/ahadeth.txt');
    List<String> hadithList = hadithcontent.split('#\r\n');

    for (int i = 0; i < hadithList.length; i++) {
      print(hadithList[i]);
      List<String> hadthisLines = hadithList[i].split('\n');
      String title = hadthisLines[0];
      hadthisLines.removeAt(0);
      HadithModel hadithModel =
          HadithModel(title: title, content: hadthisLines);
      ahadithList.add(hadithModel);
      setState(() {});
    }
  }
}
