import 'package:bbl/button_data.dart';
import 'package:bbl/components/button.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  final List<ButtonData> buttons;

  const ButtonPage({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < 3; i++)
            Button(
              buttonData: buttons[i],
              buttonIndex: i,
            ),
        ],
      ),
    );
  }
}
