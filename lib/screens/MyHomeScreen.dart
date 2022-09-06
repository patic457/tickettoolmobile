import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sosotickettool/screens/CreateTicketScreen.dart';
import 'package:sosotickettool/screens/DashboardScreen.dart';
import 'package:sosotickettool/screens/DispatcherScreen.dart';
import 'package:sosotickettool/screens/HistoryScreen.dart';
import 'package:sosotickettool/widgets/AppBarWidget.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _counter = 0;
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  final List<Widget> _screenWidget = <Widget>[
    DashboardScreen(),
    DispatcherScreen(),
    const HistoryScreen()
  ];

  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.productHunt),
      label: 'Dispatcher',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.history),
      label: 'History',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _createTicket() {
    Navigator.pushNamed(context, '/create');
  }

  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBarWidget().appBar(context, widget.title, 'main');
    Widget body = _screenWidget.elementAt(_selectedIndex);

    Widget floatingActionButton = FloatingActionButton(
      child: Icon(FontAwesomeIcons.plus),
      onPressed: _createTicket,
    );

    Widget bottomNavigationBar = BottomNavigationBar(
      items: _menuBar,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: const Color(0xFF9D9D9D),
      onTap: _onItemTapped,
    );

    Widget scaffold = Scaffold(
      appBar: appbar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );

    return GestureDetector(child: scaffold);
  }
}
