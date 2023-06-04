import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

void call(String number) async {
  await FlutterPhoneDirectCaller.callNumber("tel://$number");
}

// void _launchCallRoger() async {
//   await FlutterPhoneDirectCaller.callNumber("tel://");
// }
