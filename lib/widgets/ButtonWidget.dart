import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  @override
  State<ButtonWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    Container dispatcherScreen = Container(
      child: const Text('DispatcherScreen'),
    );
    return dispatcherScreen;
  }
}
