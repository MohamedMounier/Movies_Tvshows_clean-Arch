import 'package:flutter/material.dart';
import 'package:to_watch_app/core/utils/services/service_locator.dart';
import 'package:to_watch_app/movies/presentation/screens/movies_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

      home: const MainMoviesScreen(),
    );
  }
}

