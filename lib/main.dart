import 'package:bbl/components/button_page.dart';
import 'package:bbl/data.dart';
import 'package:bbl/speak.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:developer';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Function listenFunc = () => log("not set listen func");

class _MyAppState extends State<MyApp> {
  final SpeechToText _speechToText = SpeechToText();
  // bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    // _speechEnabled = 
    await _speechToText.initialize();
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
  }

  void _stopListening() async {
    await _speechToText.stop();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
    log(_lastWords);
  }

  void listen() async {
    if (_speechToText.isNotListening) {
      await flutterTts.awaitSpeakCompletion(true);
      _startListening();
      return;
    }
    _stopListening();
  }

  @override
  Widget build(BuildContext context) {
    listenFunc = listen;

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
