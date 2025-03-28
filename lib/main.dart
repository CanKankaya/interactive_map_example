import 'package:flutter/material.dart';

import 'screens/supported_countries_map.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SMapExampleApp());
}

class SMapExampleApp extends StatelessWidget {
  const SMapExampleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Worldmap Example',
      theme: ThemeData(
          primarySwatch: Colors.blue, visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Countries World Map',
            style: TextStyle(color: Colors.blue),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const SupportedCountriesMap(),
        ));
  }
}
