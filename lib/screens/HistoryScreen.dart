import 'package:flutter/material.dart';
import 'package:sosotickettool/widgets/ListViewHistoryWidget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    var cc = Column(children: [Text('History')]);
    return cc;
  }
}
