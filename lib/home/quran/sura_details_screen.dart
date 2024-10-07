import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/app_colors.dart';
import 'package:islamic_app/home/models/quran_model.dart';
import 'package:islamic_app/home/quran/sura_style.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  static const String routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as QuranModel;
    if (verses.isEmpty) {
      loadFile(args.indexOfSura);
    }

    return Stack(children: [
      Image.asset('assets/images/background/background.png'),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            args.nameOfSura,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.08),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.separated(
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                    return SuraStyle(index: index, content: verses[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: AppColors.primaryLightColor,
                      thickness: 2,
                    );
                  },
                ),
              ),
      )
    ]);
  }

  Future<void> loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/quran/${index + 1}.txt');
    List<String> lines =
        content.split('\n'); // تأكد من استخدام '\n' بدلاً من '/n'

    verses = lines;
    setState(() {});
  }
}
