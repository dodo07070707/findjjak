import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<int?> _howMany;

  @override
  void initState() {
    super.initState();
    _howMany = getMany();
  }

  Future<int?> getMany() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? year = prefs.getInt('Year');
    return year;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: const Scaffold(body: StartScreen()),
    );
  }
}
