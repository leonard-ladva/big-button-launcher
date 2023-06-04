import 'actions/ask_ai.dart';
import 'package:bbl/button_data.dart';
import 'package:bbl/actions/call.dart';
import 'package:bbl/actions/share_location.dart';
import 'package:bbl/actions/launch_app.dart';
import 'package:bbl/actions/speech_to_text.dart';

var homePageData = ButtonData(
  name: "Home Page",
  description: "This is the home page.",
  children: [
    ButtonData(
      name: "Apps",
      children: [
        ButtonData(name: "Educational", children: [
          ButtonData(
            name: "Duolingo",
            action: () => launchApp("Duolingo"),
          ),
          ButtonData(
            name: "Eye practice",
            action: () => launchApp("Eye practice"),
          ),
          ButtonData(
            name: "Todo list",
            action: () => launchApp("Todo list"),
          ),
        ]),
        ButtonData(name: "Entertainment", children: [
          ButtonData(
            name: "Music",
            children: [
              ButtonData(
                name: "Spotify",
                action: () => launchApp("Spotify"),
              ),
              ButtonData(
                name: "Shazam",
                action: () => launchApp("Shazam"),
              ),
              ButtonData(
                name: "SoundCloud",
                action: () => launchApp("SoundCloud"),
              ),
            ],
          ),
          ButtonData(name: "Videos", children: [
            ButtonData(
              name: "Youtube",
              action: () => launchApp("Youtube"),
            ),
            ButtonData(
              name: "Netflix",
              action: () => launchApp("Netflix"),
            ),
            ButtonData(
              name: "Go3",
              action: () => launchApp("Go3"),
            ),
          ]),
          ButtonData(
            name: "Games",
            children: [
              ButtonData(
                name: "Chess",
                action: () => launchApp("Chess"),
              ),
              ButtonData(
                name: "Sudoku",
                action: () => launchApp("Sudoku"),
              ),
              ButtonData(
                name: "Tic Tac Toe",
                action: () => launchApp("Tic Tac Toe"),
              ),
            ],
          ),
        ]),
        ButtonData(name: "Blind Tools", children: [
          ButtonData(
            name: "Be My Eyes",
            action: () => launchApp("Be My Eyes"),
          ),
          ButtonData(
            name: "BlindSquare",
            action: () => launchApp("BlindSquare"),
          ),
          ButtonData(
            name: "Braille Touch",
            action: () => launchApp("Braille Touch"),
          ),
        ]),
      ],
    ),
    ButtonData(
      name: "Ask AI",
      description: "Ask A I",
      action: () => listen(askAi),
    ),
    ButtonData(
      name: "Actions",
      children: [
        ButtonData(
          name: "Share Location",
          action: () => shareLocation(),
        ),
        ButtonData(name: "Call", children: [
          ButtonData(name: "Roger", action: () => call(contactName: "Roger")),
          ButtonData(
              name: "Leonard", action: () => call(contactName: "Leonard")),
          const ButtonData(name: "112"),
        ]),
        ButtonData(
          name: "AI Rapper",
          description: "A I Song Generation",
          action: () => askAi(
            "Write one coding rap verse, include only rap not anything else. Max 4 senteces, no more than 4 sentences.",
          ),
        ),
      ],
    ),
  ],
);
