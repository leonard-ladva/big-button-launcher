import 'package:bbl/button_data.dart';
import 'package:bbl/components/button_page.dart';
import 'package:bbl/speak.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class Button extends StatelessWidget {
  final ButtonData buttonData;
  final int buttonIndex;

  const Button({
    super.key,
    required this.buttonData,
    required this.buttonIndex,
  });

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
              speak(buttonData.name);
            },
            onTap: () {
              vibrate();
              speak(buttonData.name);

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
