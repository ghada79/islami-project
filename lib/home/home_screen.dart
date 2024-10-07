import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/home/hadith/hadith_tab.dart';
import 'package:islamic_app/home/quran/quran_tab.dart';
import 'package:islamic_app/home/radio/radio_tab.dart';
import 'package:islamic_app/home/sebha/sebha_tab.dart';

import '../app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [QuranTab(), HadithTab(), SebhaTab(), RadioTab()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/background/background.png'),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.app_title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppColors.primaryColor, //,
                //  primaryColor: AppColors.primaryLightColor, // استخدم اللون من كلاس الألوان
              ),
              child: BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  selectedItemColor: AppColors.blackColor,
                  unselectedItemColor: AppColors.whiteColor,
                  showUnselectedLabels: true,
                  backgroundColor: AppColors.primaryLightColor,
                  items: [
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/icons/quran.png'),
                        ),
                        label: AppLocalizations.of(context)!.quran),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/icons/hadeth_icon.png'),
                        ),
                        label: AppLocalizations.of(context)!.hadith),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/icons/sebha_icon.png'),
                        ),
                        label: AppLocalizations.of(context)!.sebha),
                    BottomNavigationBarItem(
                        icon: const ImageIcon(
                          AssetImage('assets/images/icons/radio_icon.png'),
                        ),
                        label: AppLocalizations.of(context)!.radio),
                  ]),
            ),
            body: tabs[selectedIndex],
          ),
        )
      ],
    );
  }
}
