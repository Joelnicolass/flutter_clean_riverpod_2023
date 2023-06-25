import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialgeneric/core/external/router/router.dart';
import 'package:socialgeneric/core/external/themes/themes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'SOCIAL MEDIA',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(colorSeed: Colors.indigo),
    );
  }
}
