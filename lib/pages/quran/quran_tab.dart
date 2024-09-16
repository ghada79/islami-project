import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp/style/my_theme_app.dart';
import 'package:islamiapp/widgets/item_sura_name.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config.dart';

class QuranTab extends StatelessWidget {
  QuranTab({Key? key}) : super(key: key);

  int selectedIndex = 0;

  List<String> suraList = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  List<int> suraAyatCounts = [
    7,
    286,
    200,
    176,
    120,
    165,
    206,
    75,
    129,
    109,
    123,
    111,
    43,
    52,
    99,
    128,
    111,
    110,
    98,
    135,
    112,
    78,
    118,
    64,
    77,
    227,
    93,
    88,
    69,
    60,
    34,
    30,
    73,
    54,
    45,
    83,
    182,
    88,
    75,
    85,
    54,
    53,
    89,
    59,
    37,
    35,
    38,
    29,
    18,
    45,
    60,
    49,
    62,
    55,
    78,
    96,
    29,
    22,
    24,
    13,
    14,
    11,
    11,
    18,
    12,
    12,
    30,
    52,
    52,
    44,
    28,
    28,
    20,
    56,
    40,
    31,
    50,
    40,
    46,
    42,
    29,
    19,
    36,
    25,
    22,
    17,
    19,
    26,
    30,
    20,
    15,
    21,
    11,
    8,
    8,
    19,
    5,
    8,
    11,
    11,
    8,
    3,
    9,
    5,
    4,
    7,
    3,
    6,
    5,
    4,
    5,
    6
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      provider.isDarkMode()
          ? Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/bg_dark.png',
                fit: BoxFit.fill,
              ),
            )
          : Container(
              width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
              ),
            ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: provider.isDarkMode()
                ? MyThemeApp.darkTheme.textTheme.headlineLarge
                : MyThemeApp.lightTheme.textTheme.headlineLarge,
          ),
        ),
        body: Column(
          children: [
            Image.asset('assets/images/quran_screen_logo.png'),
            Divider(
              color: provider.isDarkMode()
                  ? MyThemeApp.darkTheme.dividerColor
                  : MyThemeApp.lightTheme.dividerColor,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppLocalizations.of(context)!.number_ayah,
                  style: provider.isDarkMode()
                      ? MyThemeApp.darkTheme.textTheme.headlineMedium
                      : MyThemeApp.lightTheme.textTheme.headlineMedium,
                ),
                Text(
                  AppLocalizations.of(context)!.sura_name,
                  style: provider.isDarkMode()
                      ? MyThemeApp.darkTheme.textTheme.headlineMedium
                      : MyThemeApp.lightTheme.textTheme.headlineMedium,
                ),
              ],
            ),
            Divider(
              color: provider.isDarkMode()
                  ? MyThemeApp.darkTheme.dividerColor
                  : MyThemeApp.lightTheme.dividerColor,
              thickness: 2,
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Text(
                            '${suraAyatCounts[index]}',
                            style: provider.isDarkMode()
                                ? MyThemeApp.darkTheme.textTheme.bodyMedium
                                : MyThemeApp.lightTheme.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: ItemSuraName(
                            suraList: suraList[index],
                            index: index,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? MyThemeApp.darkTheme.dividerColor
                          : MyThemeApp.lightTheme.dividerColor,
                      thickness: 2,
                    );
                  },
                  itemCount: suraList.length),
            ),
          ],
        ),
      )
    ]);
  }
}
