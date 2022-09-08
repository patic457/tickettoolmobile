import 'package:flutter/material.dart';
import 'package:sosotickettool/widgets/ListViewHistoryWidget.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ListViewHistoryWidget();
  }
}
