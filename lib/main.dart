import 'package:coversor_de_moedas/pages/api_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Colors.amber,
          primaryColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder:
                OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
            focusedBorder:
                OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)
            ),
            hintStyle: TextStyle(color: Colors.amber),
            labelStyle: TextStyle(color: Colors.amber, fontSize: 25),
          ),
      ),
      home: const ApiPage(),
    );
  }
}
