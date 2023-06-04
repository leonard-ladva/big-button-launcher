import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

var phoneNumbers = <String, String>{
  "Leonard": "+37225026036",
  "Roger": "+37253876410",
};

void call(String contactName) async {
  final number = phoneNumbers[contactName];
  if (number == null) {
    throw Exception('Contact $contactName not in list.');
  }
  await FlutterPhoneDirectCaller.callNumber("tel://$number");
}
