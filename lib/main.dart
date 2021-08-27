import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:camera/camera.dart';

// import './screens/home_screen.dart';
// import './screens/login_screen.dart';
import './screens/landing_screen.dart';
import './screens/camera_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect-O',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF128C7E),
      ),
      home: LandingScreen(),
    );
  }
}
