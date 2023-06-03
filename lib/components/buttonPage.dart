import 'package:bbl/buttonData.dart';
import 'package:bbl/components/button.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  final List<ButtonData> buttons;
  // final Function changePageFunc;

  const ButtonPage({
    super.key,
    required this.buttons,
    // required this.changePageFunc,
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
              // changePageFunc: changePageFunc,
            ),
        ],
      ),
    );
  }
}
