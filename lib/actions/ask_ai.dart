import 'dart:developer';

import 'package:bbl/speak.dart';
import 'package:dart_openai/dart_openai.dart';

void askAi(String prompt) async {
  OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
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
}
