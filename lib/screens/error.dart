import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
              Text('Something went wrong.'),
              Text('Reinitializing connection...'),
          ],
        ),
      ),
    );
  }
}