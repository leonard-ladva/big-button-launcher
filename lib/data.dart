import 'package:bbl/button_data.dart';
import 'package:bbl/speak.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:bbl/actions/call.dart';

var packageNames = <String, String>{
  "Spotify": "com.spotify.music",
  "Shazam": "com.shazam.android",
  "Youtube": "com.google.android.youtube",
  "Netflix": "com.netflix.mediaclient",
  "Go3": "com.go3mobile.go3",
};

var phoneNumbers = <String, String>{
  "Leonard": "+37225026036",
  "Roger": "+37253876410",
};

var homePageData = ButtonData(
  name: "Home Page",
  description: "This is the home page.",
  children: [
    const ButtonData(name: "Entertainment", children: [
      ButtonData(name: "Music", children: [
        ButtonData(name: "Spotify", action: _launchSpotify),
        ButtonData(name: "Write a song"),
        ButtonData(name: "Shazam"),
      ]),
      ButtonData(name: "Videos", children: [
        ButtonData(name: "Youtube"),
        ButtonData(name: "Netflix"),
        ButtonData(name: "Go3"),
      ]),
      ButtonData(name: "Games", children: [
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
        ButtonData(name: "Roger", action: () => call(phoneNumbers["Roger"]!)),
        ButtonData(
            name: "Leonard", action: () => call(phoneNumbers["Leonard"]!)),
        const ButtonData(name: "112"),
      ]),
      const ButtonData(name: "Video Call", children: [
        ButtonData(name: "Mom"),
        ButtonData(name: "Peter"),
        ButtonData(name: "George"),
      ]),
      const ButtonData(name: "Message", children: [
        ButtonData(name: "Instagram"),
        ButtonData(name: "Facebook"),
        ButtonData(name: "Whatsapp"),
      ]),
    ]),
  ],
);

void _launchSpotify() async {
  if (await LaunchApp.isAppInstalled(androidPackageName: 'com.spotify.music')) {
    await LaunchApp.openApp(
        androidPackageName: 'com.spotify.music', openStore: true);
  } else {
    speak('Spotify app is not installed.');
  }
}

void speakError(String error) async {
  await flutterTts.awaitSpeakCompletion(true);
  await flutterTts.setVolume(1.0);
  await flutterTts.setSpeechRate(0.8);
  await flutterTts.setPitch(1.0);

  flutterTts.speak(error);
}
