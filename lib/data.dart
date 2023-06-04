import 'package:bbl/button_data.dart';
import 'package:bbl/actions/call.dart';
import 'package:bbl/actions/share_location.dart';
import 'package:bbl/actions/launch_app.dart';

var homePageData = ButtonData(
  name: "Home Page",
  description: "This is the home page.",
  children: [
    ButtonData(name: "Entertainment", children: [
      ButtonData(name: "Music", children: [
        ButtonData(name: "Spotify", action: () => launchApp("Spotify")),
        const ButtonData(name: "Write a song"),
        ButtonData(name: "Shazam", action: () => launchApp("Shazam")),
      ]),
      ButtonData(name: "Videos", children: [
        ButtonData(name: "Youtube", action: () => launchApp("Youtube")),
        ButtonData(name: "Netflix", action: () => launchApp("Netflix")),
        ButtonData(name: "Go3", action: () => launchApp("Go3")),
      ]),
      const ButtonData(name: "Games", children: [
        ButtonData(name: "Snake"),
        ButtonData(name: "Word Guess"),
        ButtonData(name: "Tic Tac Toe"),
      ]),
    ]),
    const ButtonData(name: "Study", children: [
      ButtonData(name: "Singing", children: [
        ButtonData(name: "Rap"),
        ButtonData(name: "Drama"),
        ButtonData(name: "Opera"),
      ]),
      ButtonData(name: "Languages", children: [
        ButtonData(name: "Duolingo"),
        ButtonData(name: "Google Translate"),
        ButtonData(name: ""),
      ]),
      ButtonData(name: "Tools", children: [
        ButtonData(name: "Be My Eyes"),
        ButtonData(name: "BlindSquare"),
        ButtonData(name: "Braille Touch"),
      ]),
    ]),
    ButtonData(name: "Social", children: [
      ButtonData(name: "Call", children: [
        ButtonData(name: "Roger", action: () => call(contactName: "Roger")),
        ButtonData(name: "Leonard", action: () => call(contactName: "Leonard")),
        const ButtonData(name: "112"),
      ]),
      const ButtonData(name: "Video Call", children: [
        ButtonData(name: "Mom"),
        ButtonData(name: "Peter"),
        ButtonData(name: "George"),
      ]),
      ButtonData(name: "Message", children: [
        ButtonData(name: "Instagram"),
        ButtonData(name: "Facebook"),
        ButtonData(
            name: "Send Location",
            action: () => shareLocation(contactName: "Rufi")),
      ]),
    ]),
  ],
);
