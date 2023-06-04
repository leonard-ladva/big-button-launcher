import 'dart:developer';

import 'package:bbl/actions/call.dart';
import 'package:bbl/actions/get_location.dart';
import 'package:bbl/speak.dart';
import 'package:flutter_sms/flutter_sms.dart';
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
  _sendSMS(message, "Rufi");
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

void _sendSMS(String message, String contactName) async {
  var recipientNumber = contacts[contactName];
  if (recipientNumber == null) {
    throw Exception('Contact $contactName not in list.');
  }

  String result = await sendSMS(message: message, recipients: [recipientNumber])
      .catchError((error) {
    return error;
  });
  log(result);
}
