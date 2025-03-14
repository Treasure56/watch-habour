import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_habour/screens/welcome.dart';
import 'package:watch_habour/utils/theme.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.white.withOpacity(0), // Set the status bar color
    statusBarIconBrightness:
        Brightness.dark, // Set icons to light (for dark backgrounds)
    statusBarBrightness:
        Brightness.dark, // For iOS, controls status bar text color
  ));
  runApp(const ProviderScope(child: OKToast(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WatchHabour',
      theme: AppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}
