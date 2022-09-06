import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:sosotickettool/services/CreateTicketService.dart';
import 'package:sosotickettool/widgets/AppBarWidget.dart';

String someVal = '';
var chosenValue;

class CreateTicketScreen extends StatefulWidget {
  @override
  State<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends State<CreateTicketScreen> {
  final createTicketController = TextEditingController();
  var cateItems = ['AIS Fiber', 'AIS 5G', 'AIS Store', 'AIS Package'];
  var dropdownvalue = 'AIS Fiber';

  onChangedDropdownCategory(value) {
    setState(() {
      chosenValue = value;
    });
  }

  void _createTicket() {
    createTicketCallApi();
    createTicketTextField(createTicketController, chosenValue);
    launchWebView();
  }

  @override
  Widget build(BuildContext context) {
    var appbar = AppBarWidget().appBar(context, 'Create Ticket', 'crateticket');

    var dropdownCategory = DropdownButton<String>(
      focusColor: Colors.white,
      value: chosenValue,
      elevation: 3,
      style: TextStyle(
        color: Colors.white,
      ),
      iconEnabledColor: Colors.black,
      items: cateItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: Colors.black)),
        );
      }).toList(),
      onChanged: (value) => onChangedDropdownCategory(value),
    );
    var ddCate = DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.greenAccent
            //add more colors
          ]),
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.57),
              blurRadius: 5,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: dropdownCategory,
      ),
    );

    var textField = TextField(
      autofocus: true,
      controller: createTicketController,
      decoration: const InputDecoration(
        hintText: 'Test Ticket',
        border: OutlineInputBorder(),
      ),
    );
    var elevatedButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(4.0),
        primary: const Color(0xffb73c23a),
        minimumSize: const Size.fromHeight(50),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.9)),
      onPressed: _createTicket,
      child: const Text(
        'Create Ticket',
        style: TextStyle(fontSize: 18.0),
      ),
    );
    Container createTicketForm = Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ddCate,
            const SizedBox(height: 15),
            textField,
            const SizedBox(height: 20),
            elevatedButton,
          ],
        ),
      ),
    );

    Widget scaffold = Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(child: createTicketForm),
    );

    return scaffold;
  }
}
