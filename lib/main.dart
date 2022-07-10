import 'package:flutter/material.dart';
import 'presentation/counter.dart';
import 'package:counter/core/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Test'),
        ),
        body: const Counter(),
      ),
    );
  }
}
