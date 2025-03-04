import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:small_vectors/home_page.dart';
import 'package:small_vectors/utility_classes/utilities.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure bindings are initialized
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Only allow portrait mode
  ]).then((_) {
    runApp(const MyApp());
  });

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: MyColorPallete.appBarColor),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
