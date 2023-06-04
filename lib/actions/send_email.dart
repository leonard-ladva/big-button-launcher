import 'dart:developer';

import 'package:bbl/speak.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

Future<void> sendEmail(
    String subject, String body, String receipentEmail) async {
  final Email email = Email(
    body: body,
    subject: subject,
    recipients: [receipentEmail],
    isHTML: false,
  );

  log("Opening email app");
  await speak("Opening email app");
  await FlutterEmailSender.send(email);
}
