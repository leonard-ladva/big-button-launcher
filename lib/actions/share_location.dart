
import 'dart:developer';

import 'package:bbl/actions/call.dart';
import 'package:bbl/actions/get_location.dart';
import 'package:bbl/speak.dart';
import 'package:geolocator/geolocator.dart';

void shareLocation({required String contactName}) async {
  final number = contacts[contactName];
  if (number == null) {
    throw Exception('Contact $contactName not in list.');
  }

  Position? position = await getCurrentLocation();
  if (position == null) {
    speak('Failed to get current location');
    return;
  }

  // Prepare the SMS message
  String message = 'My current location: '
      'Latitude: ${position.latitude}, '
      'Longitude: ${position.longitude}';
  log(message);
  // Define the recipients
  // List<String> recipients = [number];

  // Send the SMS
  // try {
  //   String _result = await sendSMS(message: message, recipients: recipients);
  //   if (_result != null) {
  //     speak('SMS sent successfully');
  //   } else {
  //     speak('Failed to send SMS');
  //   }
  // } catch (error) {
  //   speak('Failed to send SMS: $error');
  // }
}
