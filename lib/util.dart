import 'package:audioplayers/audioplayers.dart';

void playSound(String audioAsset) async {
  AudioCache player = AudioCache();
  String alarmAudioPath = "audio/$audioAsset";
  player.play(alarmAudioPath);
}