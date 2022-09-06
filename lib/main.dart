import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sosotickettool/screens/CreateTicketScreen.dart';
import 'package:sosotickettool/screens/MyHomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soso Ticket Tool',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomeScreen(title: 'Soso Ticket Tool'),
        '/create': (context) => CreateTicketScreen(),
        // '/login': (context) => LoginScreen(),
        // '/register': (context) => LoginScreen(),
      },
    );
  }
}
