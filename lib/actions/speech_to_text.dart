import 'package:bbl/speak.dart';
import 'package:speech_to_text/speech_to_text.dart';

final SpeechToText _speechToText = SpeechToText();

void initSpeech() async {
  await _speechToText.initialize();
}

void listen(void Function(String) onResult) async {
  // if (_speechToText.isListening) return;
  flutterTts.stop();

  if (_speechToText.isListening) {
    _speechToText.stop();
    return;
  }

  _speechToText.listen(
    partialResults: false,
    onResult: (result) {
      onResult(result.recognizedWords);
    },
  );
}
