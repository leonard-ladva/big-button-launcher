import 'dart:async';
import 'dart:developer';

import 'package:bbl/speak.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_beep/flutter_beep.dart';

void askAi(String prompt) async {
  log("Asking AI: '$prompt'");
  beeper();
  try {
    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: prompt,
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );
    log(chatCompletion.choices[0].message.content);
    speak(chatCompletion.choices[0].message.content);
  } catch (e) {
    log(e.toString());
    speak(e.toString());
  }
  stopBeep();
}

Timer? beepTimer;

void beeper() {
  beepTimer = Timer.periodic(const Duration(milliseconds: 1000), beep);
}

void beep(Timer timer) {
  FlutterBeep.beep();
  // FlutterBeep.playSysSound(90);
}

void stopBeep() {
  if (beepTimer == null) return;
  beepTimer!.cancel();
}
