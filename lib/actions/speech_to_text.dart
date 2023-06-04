import 'package:bbl/actions/ask_ai.dart';
import 'package:bbl/speak.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

final SpeechToText _speechToText = SpeechToText();

void initSpeech() async {
  await _speechToText.initialize();
}

void _onSpeechResult(SpeechRecognitionResult result) {
  askAi(result.recognizedWords);
}

void listen() async {
  await flutterTts.awaitSpeakCompletion(true);

  if (_speechToText.isNotListening) {
    _speechToText.listen(partialResults: false, onResult: _onSpeechResult);
    return;
  }

  _speechToText.stop();
}
