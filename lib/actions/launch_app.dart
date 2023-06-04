import 'package:bbl/speak.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

var packageNames = <String, String>{
  "Spotify": "com.spotify.music",
  "Shazam": "com.shazam.android",
  "Youtube": "com.google.android.youtube",
  "Netflix": "com.netflix.mediaclient",
  "Go3": "tv.go3.android.mobile",
  "SoundCloud": "com.soundcloud.android",
  "Duolingo": "com.duolingo",
  "Eye practice": "com.eye.exercises.practice",
  "Todo list": "com.tasks.android",
  "Blind Square": "fi.illuusio.blindsquare",
  "Be My Eyes": "com.bemyeyes.bemyeyes",
  "Chess": "com.example.chess",
  "Sudoku": "com.sudoku",
  "Tic Tac Toe": "com.tictactoe",
};

void launchApp(String appName) async {
  final packageName = packageNames[appName];
  if (packageName == null) {
    throw Exception('App $appName not in list.');
  }
  if (await LaunchApp.isAppInstalled(androidPackageName: packageName)) {
    await LaunchApp.openApp(androidPackageName: packageName, openStore: true);
  } else {
    speak('$appName app is not installed.');
  }
}
