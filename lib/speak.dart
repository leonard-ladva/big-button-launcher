import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();

void speak(String sentence) async {
  await flutterTts.awaitSpeakCompletion(false);
  await flutterTts.speak(sentence);
}

void setSpeakSettings() async {
  await flutterTts.setVolume(1.0);
  await flutterTts.setSpeechRate(0.8);
  await flutterTts.setPitch(1.0);
}
