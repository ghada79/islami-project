import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp/providers/app_config.dart';
import 'package:islamiapp/style/app_color.dart';
import 'package:islamiapp/widgets/language_bottom_sheet.dart';
import 'package:islamiapp/widgets/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../style/my_theme_app.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
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
          body: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: provider.isDarkMode()
                      ? MyThemeApp.darkTheme.textTheme.headlineLarge
                      : MyThemeApp.lightTheme.textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    showLanguageBottomSheet();
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColor.primaryLightColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.appLanguage == 'ar'
                              ? AppLocalizations.of(context)!.arabic
                              : AppLocalizations.of(context)!.english,
                          style: provider.isDarkMode()
                              ? MyThemeApp.darkTheme.textTheme.bodyMedium
                              : MyThemeApp.lightTheme.textTheme.bodyMedium,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 32,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: provider.isDarkMode()
                      ? MyThemeApp.darkTheme.textTheme.headlineLarge
                      : MyThemeApp.lightTheme.textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    showThemeBottomSheet();
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColor.primaryLightColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.isDarkMode()
                              ? AppLocalizations.of(context)!.dark
                              : AppLocalizations.of(context)!.light,
                          style: provider.isDarkMode()
                              ? MyThemeApp.darkTheme.textTheme.bodyMedium
                              : MyThemeApp.lightTheme.textTheme.bodyMedium,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 32,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
