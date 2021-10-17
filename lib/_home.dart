// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sa/_setting.dart';
import 'Pages/select_category.dart';
import 'Pages/wish_list_page.dart';
import 'Pages/home_page.dart';
import 'Pages/suggestion_page.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  int _selectedIndex = 0;
  static const String appName = "sa";
  static final List<Widget> _widgetOptions = <Widget>[
    HomeActivity(),
    SuggestionPage(),
    wishListPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("----------------------------------------------");
    print(simple.minPriceRange);

    getItems();
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectCategory()),
                );
              },
              icon: const Icon(
                Icons.filter,
                color: Colors.black,
              )),
          MaterialButton(
            onPressed: signOut,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  FirebaseAuth.instance.currentUser!.photoURL.toString()),
              backgroundColor: Colors.white,
              radius: 16,
            ),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_suggest_sharp),
            label: 'suggestion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'wishlist',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<void> getItems() async {
    var request = http.Request('GET',
        Uri.parse('https://shoppingadvisor.azurewebsites.net/api/getitems'));

    http.StreamedResponse response = await request.send();

    // var jsonResponse =
    //     convert.jsonDecode(await response.stream.bytesToString());
    List<item> items = [];
    // ignore: avoid_types_as_parameter_names
    // print(items);
    // await convert
    //     .jsonDecode(await response.stream.bytesToString())['items']
    //     .forEach((item) => items.add(item(
    //         item["itemID"],
    //         item["productID"],
    //         item["sellerDetails"],
    //         item["sellerLocation"][0],
    //         item["sellerLocation"][1],
    //         item["itemImageUrl"],
    //         item["itemDetails"],
    //         item["category"],
    //         item["price"],
    //         item["locationName"],
    //         item["sub_category"])));
    // simple.items = items;
    // print(items.length);
  }
}
