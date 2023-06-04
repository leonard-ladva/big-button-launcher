import 'package:bbl/button_data.dart';
import 'package:bbl/main.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter_tts/flutter_tts.dart';

const homePageData = ButtonData(
  name: "Home Page",
  description: "This is the home page.",
  children: [
    ButtonData(name: "Entertainment", children: [
      ButtonData(name: "Music", children: [
        ButtonData(name: "Spotify", action: _launchSpotify),
        ButtonData(name: "Write a song"),
        ButtonData(name: "Shazam", action: _launchShazam),
      ]),
      ButtonData(name: "Videos", children: [
        ButtonData(name: "Youtube", action: _launchYouTube),
        ButtonData(name: "Netflix", action: _launchNetflix),
        ButtonData(name: "Go3", action: _launchGO3),
      ]),
      ButtonData(name: "Games", children: [
        ButtonData(name: "Snake"),
        ButtonData(name: "Word Guess"),
        ButtonData(name: "Tic Tac Toe"),
      ]),
    ]),
    ButtonData(name: "Study", children: [
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
        ButtonData(name: "Mom"),
        ButtonData(name: "Brother"),
        ButtonData(name: "911"),
      ]),
      ButtonData(name: "Video Call", children: [
        ButtonData(name: "Mom"),
        ButtonData(name: "Peter"),
        ButtonData(name: "George"),
      ]),
      ButtonData(name: "Message", children: [
        ButtonData(name: "Instagram"),
        ButtonData(name: "Facebook"),
        ButtonData(name: "Whatsapp"),
      ]),
    ]),
  ],
);

_launchSpotify() async {
  if (await LaunchApp.isAppInstalled(androidPackageName: 'com.spotify.music')) {
    LaunchApp.openApp(androidPackageName: 'com.spotify.music');
  } else {
    throw 'Spotify app is not installed.';
  }
}

void _launchShazam() async {
  if (await LaunchApp.isAppInstalled(
      androidPackageName: 'com.shazam.android')) {
    LaunchApp.openApp(androidPackageName: 'com.shazam.android');
  } else {
    throw 'Shazam app is not installed.';
  }
}

void _launchYouTube() async {
  if (await LaunchApp.isAppInstalled(
      androidPackageName: 'com.google.android.youtube')) {
    LaunchApp.openApp(androidPackageName: 'com.google.android.youtube');
  } else {
    throw 'YouTube app is not installed.';
  }
}

void _launchNetflix() async {
  if (await LaunchApp.isAppInstalled(
      androidPackageName: 'com.netflix.mediaclient')) {
    LaunchApp.openApp(androidPackageName: 'com.netflix.mediaclient');
  } else {
    throw 'Netflix app is not installed.';
  }
}

void _launchGO3() async {
  if (await LaunchApp.isAppInstalled(androidPackageName: 'com.go3mobile.go3')) {
    LaunchApp.openApp(androidPackageName: 'com.go3mobile.go3');
  } else {
    speakError("Go3 is not insalled");
  }
}

void speakError(String error) async {
  await flutterTts.awaitSpeakCompletion(true);
  await flutterTts.setVolume(1.0);
  await flutterTts.setSpeechRate(0.8);
  await flutterTts.setPitch(1.0);

  flutterTts.speak(error);
}
