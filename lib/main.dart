import 'package:flutter/material.dart';
import 'package:notification_testing/alarm_permission_helper.dart';
import 'package:notification_testing/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await requestExactAlarmPermission();
  NotificationService().showRepeatingNotification(
    id: 1,
    title: 'Test Notification',
    body: 'This is a test notification scheduled for 5 seconds later.',
    // scheduledTime: DateTime.now().add(const Duration(minutes: 1)),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Testing')),
        body: Container(
          child: const Center(child: Text('Notification Testing')),
        ),
      ),
    );
  }
}
