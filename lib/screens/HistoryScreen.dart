import 'package:flutter/material.dart';
import 'package:sosotickettool/widgets/TicketDetailWidget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    var txt = 'History';
    var cc = Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TicketDetailWidget(text: txt),
          ]),
    );
    return cc;
  }
}
