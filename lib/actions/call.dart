import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

var contacts = <String, String>{
  "Leonard": "+37225026036",
  "Roger": "+37253876410",
  "Rufi": "+37124609660",
};

void call({required String contactName}) async {
  final number = contacts[contactName];
  if (number == null) {
    throw Exception('Contact $contactName not in list.');
  }
  await FlutterPhoneDirectCaller.callNumber("tel://$number");
}
