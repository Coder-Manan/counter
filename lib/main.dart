import 'package:flutter/material.dart';
import 'presentation/counter.dart';
import 'package:counter/core/locator.dart';
import 'package:counter/services/local_storage_service.dart';

LocalStorageService localStorageService = locator<LocalStorageService>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  LocalStorageService localStorageService = locator<LocalStorageService>();
  counter = localStorageService.getCounter();
  runApp(const MyApp());
}

int counter = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Test'),
        ),
        body: Counter(
          localStorageService: localStorageService,
        ),
      ),
    );
  }
}
