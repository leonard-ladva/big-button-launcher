import 'package:bbl/button_data.dart';
import 'package:bbl/components/button_page.dart';
import 'package:bbl/main.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class Button extends StatelessWidget {
  final ButtonData buttonData;
  final int buttonIndex;
  // final FlutterTts flutterTts = FlutterTts();

  Button({
    super.key,
    required this.buttonData,
    required this.buttonIndex,
  });

  void speakButtonName() async {
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.8);
    await flutterTts.setPitch(1.0);

    flutterTts.speak(buttonData.name);
  }

  void vibrate() {
    List<int> vibrations = [0, 200];
    for (var i = 0; i < buttonIndex; i++) {
      vibrations.addAll([100, 200]);
    }

    Vibration.vibrate(pattern: vibrations);
  }

  static bool canPop(BuildContext context) {
    final NavigatorState? navigator = Navigator.maybeOf(context);
    return navigator != null && navigator.canPop();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: GestureDetector(
            onDoubleTap: () {
              if (!canPop(context)) return;
              Navigator.pop(context);
            },
            onLongPress: () {
              vibrate();
              speakButtonName();
            },
            onTap: () {
              vibrate();
              speakButtonName();

              if (buttonData.action != null) {
                buttonData.action!();
                return;
              }

              if (buttonData.children.isEmpty) {
                return;
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ButtonPage(
                    buttons: buttonData.children,
                  ),
                ),
              );
            },
            child: Container(
              color: Colors.deepPurple,
              child: Center(
                child: Text(
                  buttonData.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
