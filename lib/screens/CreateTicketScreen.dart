import 'dart:convert';
import 'dart:ui';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sosotickettool/widgets/AppBarWidget.dart';
import 'package:sosotickettool/controllers/CreateTicketController.dart';

String someVal = '';
var chosenValue;

class CreateTicketScreen extends StatefulWidget {
  @override
  State<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends State<CreateTicketScreen> {
  final List<Map<String, dynamic>> _roles = [
    {"name": "Super Admin", "desc": "Having full access rights", "role": 1},
    {
      "name": "Admin",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Manager",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Technician",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {
      "name": "Customer Support",
      "desc": "Having Customer Support access rights",
      "role": 5
    },
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];
  final createTicketController = TextEditingController();
  var cateItems = ["AIS Fiber", "AIS PLAY", "AIS Store"];
  var dropdownvalue = 'AIS Fiber';

  onChangedDropdownCategory(value) {
    setState(() {
      chosenValue = value;
    });
  }

  void _createTicket() {
    // createTicketCallApi();
    // createTicketTextField(createTicketController, chosenValue);
  }

  @override
  Widget build(BuildContext context) {
    var appbar = AppBarWidget().appBar(context, 'Create Ticket', 'crateticket');

    var dropdownCategoryField = TextDropdownFormField(
      onSaved: (dynamic str) {},
      onChanged: (value) => onChangedDropdownCategory(value),
      validator: (dynamic str) {},
      options: cateItems,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.arrow_drop_down),
        labelText: "Category",
      ),
      // dropdownHeight: 120,
    );

    var textField = TextField(
      autofocus: true,
      controller: createTicketController,
      decoration: const InputDecoration(
        hintText: 'Test Ticket',
        border: OutlineInputBorder(),
        labelText: "Problem",
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
            dropdownCategoryField,
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
