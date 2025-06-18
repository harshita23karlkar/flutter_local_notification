// alarm_permission_helper.dart

import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:permission_handler/permission_handler.dart';

// Future<void> requestExactAlarmPermission() async {
//   if (Platform.isAndroid) {
//     final intent = AndroidIntent(
//       action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
//       flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
//     );
//     await intent.launch();
//   }
// }
Future<void> requestExactAlarmPermission() async {
  if (Platform.isAndroid) {
    if (await Permission.ignoreBatteryOptimizations.isDenied) {
      await Permission.ignoreBatteryOptimizations.request();
    }

    const intent = AndroidIntent(
      action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }
}
