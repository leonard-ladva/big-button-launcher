import 'package:bbl/actions/speech_to_text.dart';
import 'package:bbl/components/button_page.dart';
import 'package:bbl/data.dart';
import 'package:bbl/env/env.dart';
import 'package:bbl/speak.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    OpenAI.apiKey =
        Env.openAiApiKey; // Initializes the package with that API key
    initSpeech();
    setSpeakSettings();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ButtonPage(
        buttons: homePageData.children,
      ),
    );
  }
}
