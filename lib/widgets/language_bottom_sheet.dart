import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp/providers/app_config.dart';
import 'package:islamiapp/style/app_color.dart';
import 'package:islamiapp/style/my_theme_app.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: AppColor.primaryLightColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
                onTap: () {
                  provider.changeLanguage('ar');
                },
                child: provider.appLanguage == 'ar'
                    ? getSelectedItem(AppLocalizations.of(context)!.arabic)
                    : getUnSelectedItem(AppLocalizations.of(context)!.arabic)),
            SizedBox(
              height: 16,
            ),
            InkWell(
                onTap: () {
                  provider.changeLanguage('en');
                },
                child: provider.appLanguage == 'en'
                    ? getSelectedItem(AppLocalizations.of(context)!.english)
                    : getUnSelectedItem(AppLocalizations.of(context)!.english))
          ],
        ),
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
        Icon(
          Icons.check,
          size: 32,
          color: Colors.white,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String text) {
    return Text(
      text,
      style: MyThemeApp.lightTheme.textTheme.titleMedium,
    );
  }
}
