import 'package:bbl/speak.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

var packageNames = <String, String>{
  "Spotify": "com.spotify.music",
  "Shazam": "com.shazam.android",
  "Youtube": "com.google.android.youtube",
  "Netflix": "com.netflix.mediaclient",
  "Go3": "com.go3mobile.go3",
};

void launchApp(String appName) async {
  final packageName = packageNames[appName];
  if (packageName == null) {
    throw Exception('App $appName not in list.');
  }
  if (await LaunchApp.isAppInstalled(androidPackageName: packageName)) {
    await LaunchApp.openApp(
        androidPackageName: packageName, openStore: true);
  } else {
    speak('$appName app is not installed.');
  }
}