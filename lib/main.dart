import 'package:flutter/material.dart';
import 'package:lms/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        iconTheme: const IconThemeData(color: Colors.black),
        hintColor: Colors.black,
        colorScheme: const ColorScheme.light(),
      ),
    );
  }
}