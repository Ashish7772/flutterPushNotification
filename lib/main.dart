import 'package:flutter/material.dart';
import 'package:atlanta_assignment/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlanta System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.indigo.shade900),
          ),
      home: MyHomePage(title: 'Flutter Local Notifications'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationService _notificationService = NotificationService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: ElevatedButton(
              child: Text('Show Notification'),
              onPressed: () async {
                await _notificationService.showNotifications();
              },
            ),
          )),
    );
  }
}
