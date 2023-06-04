import 'dart:developer';
import 'package:bbl/actions/get_location.dart';
import 'package:bbl/actions/send_email.dart';
import 'package:bbl/speak.dart';
import 'package:geolocator/geolocator.dart';

void shareLocation() async {
  // final number = contacts[contactName];
  // if (number == null) {
  //   throw Exception('Contact $contactName not in list.');
  // }

  Position? position = await getCurrentLocation();
  if (position == null) {
    speak('Failed to get current location');
    return;
  }

  String message = 'My current location: '
      'Latitude: ${position.latitude}, '
      'Longitude: ${position.longitude}';

  log(message);
  await sendEmail("Help me!!", message, "rufialiyev2005@gmail.com");
}
