import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sosotickettool/screens/CreateTicketScreen.dart';
import 'package:sosotickettool/screens/DashboardScreen.dart';
import 'package:sosotickettool/screens/DispatcherScreen.dart';
import 'package:sosotickettool/screens/HistoryScreen.dart';
import 'package:sosotickettool/widgets/AppBarWidget.dart';
import 'package:sosotickettool/widgets/BottomNavigationBarWidget.dart';

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
    // DispatcherScreen(),
    const HistoryScreen()
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
    Widget body = _screenWidget.elementAt(_selectedIndex);

    Widget floatingActionButton = FloatingActionButton(
      // backgroundColor: Colors.green[900],
      backgroundColor: Colors.green.shade500,
      child: Icon(FontAwesomeIcons.plus),
      onPressed: _createTicket,
    );

    List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.house),
        label: 'Home',
      ),
      // const BottomNavigationBarItem(
      //   icon: Icon(FontAwesomeIcons.productHunt),
      //   label: 'Dispatcher',
      // ),
      const BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.clock),
        label: 'History',
      ),
    ];

    Widget bottomNavigationBar = BottomNavigationBar(
      items: _menuBar,
      currentIndex: _selectedIndex,
      elevation: 4.0,
      selectedItemColor: Colors.green,
      unselectedItemColor: const Color(0xFF9D9D9D),
      onTap: _onItemTapped,
    );
    // Widget bottomNavigationBar = BottomNavigationBarWidget(onTap: _onItemTapped, menuBar: _menuBar);

    Widget scaffold = Scaffold(
      appBar: AppBarWidget(title: widget.title, type: 'main'),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

    return GestureDetector(child: scaffold);
  }
}
