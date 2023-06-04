import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();

void speak(String sentence) async {
  await flutterTts.awaitSpeakCompletion(false);
  await setSpeakSettings();
  await flutterTts.speak(sentence);
}

Future setSpeakSettings() async {
  await flutterTts.setVolume(1.0);
  await flutterTts.setSpeechRate(0.6);
  await flutterTts.setPitch(1.0);
  await flutterTts.setVoice({"name": "en-us-x-tpf-local", "locale": "en-US"});
}
