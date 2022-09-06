import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

void createTicketCallApi() {
  var response =
      http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  // print("Create Ticket => fetchAlbumResponse" + response.toString());

  response.then((data) {
    String hZonesString = data.body;
    print("API Response => " + hZonesString.toString());
  }, onError: (e) {
    print(e);
  });
}

createTicketTextField(createTicketController, chosenValue) {
  var _createTicketController = createTicketController.text != ''
      ? createTicketController.text
      : 'Test Ticket';
  print("Create Text Ticket Form => " + _createTicketController);
  print("Dropdownlist => " + chosenValue.toString());
}

class CreateTicketController extends GetxController {
   var ticketItems = List<Product>().obs; 
}
