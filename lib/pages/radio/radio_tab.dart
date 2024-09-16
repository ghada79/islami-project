import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamiapp/models/radio_model.dart';
import 'package:islamiapp/service/radio_service.dart';
import 'package:islamiapp/style/my_theme_app.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config.dart';

class RadioTab extends StatefulWidget {
  @override
  _RadioTabState createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final RadioService radioService = RadioService(Dio());
  List<RadioModel>? radioStations;
  int currentIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRadioStations();
  }

  Future<void> _fetchRadioStations() async {
    radioStations = await radioService.fetchRadioStations();
    setState(() {
      isLoading = false;
      if (radioStations != null && radioStations!.isNotEmpty) {
        currentIndex = 0;
      }
    });
  }

  void _playRadio() {
    if (radioStations != null && radioStations!.isNotEmpty) {
      radioService.playRadio(radioStations![currentIndex].url!);
    }
  }

  void _stopRadio() {
    radioService.stopRadio();
  }

  void _nextRadio() {
    if (radioStations != null && radioStations!.isNotEmpty) {
      setState(() {
        currentIndex = (currentIndex + 1) % radioStations!.length;
      });
      _playRadio();
    }
  }

  void _previousRadio() {
    if (radioStations != null && radioStations!.isNotEmpty) {
      setState(() {
        currentIndex =
            (currentIndex - 1 + radioStations!.length) % radioStations!.length;
      });
      _playRadio();
    }
  }

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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            backgroundColor: Colors.transparent,
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: MyThemeApp.lightTheme.primaryColor,
                ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/radio_image.png'),
                    Text(
                      radioStations != null && radioStations!.isNotEmpty
                          ? radioStations![currentIndex].name ??
                              'إذاعة القرآن الكريم'
                          : 'إذاعة القرآن الكريم',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: _previousRadio,
                          icon: Icon(Icons.skip_previous,
                              color: MyThemeApp.lightTheme.primaryColor),
                        ),
                        IconButton(
                          onPressed: _playRadio,
                          icon: Icon(Icons.play_arrow,
                              color: MyThemeApp.lightTheme.primaryColor),
                        ),
                        IconButton(
                          onPressed: _stopRadio,
                          icon: Icon(
                            Icons.stop,
                            color: MyThemeApp.lightTheme.primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: _nextRadio,
                          icon: Icon(Icons.skip_next,
                              color: MyThemeApp.lightTheme.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    radioService.stopRadio();
    super.dispose();
  }
}
