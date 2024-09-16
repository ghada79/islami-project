import 'package:dio/dio.dart';
import 'package:islamiapp/models/radio_model.dart';
import 'package:just_audio/just_audio.dart';

class RadioService {
  final Dio dio;
  final AudioPlayer audioPlayer = AudioPlayer();

  RadioService(this.dio);

  Future<List<RadioModel>> fetchRadioStations() async {
    try {
      final response =
          await dio.get('https://mp3quran.net/api/v3/radios?language=ar');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> radioStat = jsonData['radios'];

      List<RadioModel> radioList = radioStat.map<RadioModel>((dynamic radios) {
        return RadioModel(
          id: radios['id'].toString(),
          name: radios['name'].toString(),
          url: radios['url'].toString(),
        );
      }).toList();

      return radioList;
    } catch (error) {
      print('Error fetching radio stations: $error');
      return [];
    }
  }

  Future<void> playRadio(String url) async {
    try {
      await audioPlayer.setUrl(url);
      audioPlayer.play();
    } catch (error) {
      print('Error playing radio: $error');
    }
  }

  void stopRadio() {
    audioPlayer.stop();
  }
}
