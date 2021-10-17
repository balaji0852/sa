import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// ignore: use_key_in_widget_constructors
class HomeActivity extends StatefulWidget {
  @override
  HomePageActivity createState() => HomePageActivity();
}

class HomePageActivity extends State<HomeActivity> {
  static const text = "your tasks";
  var jsonResponse;
  bool flag = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItems();
  }

  Future<void> getItems() async {
    var request = http.Request('GET',
        Uri.parse('https://shoppingadvisor.azurewebsites.net/api/getitems'));

    http.StreamedResponse response = await request.send();

    setState(()  {
      jsonResponse = convert.jsonDecode(await response.stream.bytesToString());
      flag = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return flag
        ? jsonResponse["items"].map((item) => Text(item))
        : Text("item");
  }
}
