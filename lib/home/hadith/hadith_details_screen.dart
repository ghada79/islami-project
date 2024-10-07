import 'package:flutter/material.dart';
import 'package:islamic_app/app_colors.dart';
import 'package:islamic_app/home/models/hadith_model.dart';

import 'hadith_style.dart';

class HadithDetailsScreen extends StatefulWidget {
  HadithDetailsScreen({super.key});

  static const String routeName = 'hadith_details';

  @override
  State<HadithDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadithDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadithModel;

    return Stack(children: [
      Image.asset('assets/images/background/background.png'),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.08),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20)),
          child: ListView.builder(
            itemCount: args.content.length,
            itemBuilder: (context, index) {
              return HadithStyle(content: args.content[index]);
            },
          ),
        ),
      )
    ]);
  }
}
