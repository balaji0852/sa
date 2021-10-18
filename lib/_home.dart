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
    HomeActivity(),
    HomeActivity(),
    HomeActivity()
  ];
  bool searchActive = false;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 3) {
        _selectedIndex = 2;
      } else {
        _selectedIndex = index;
      }
      if (index == 0) {
        simple.currentPageIndex = 0;
      } else if (index == 1) {
        simple.currentPageIndex = 1;
      } else if (index == 2) {
        simple.currentPageIndex = 2;
      } else {
        simple.currentPageIndex = 3;
      }
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
          if (!searchActive)
            IconButton(
              onPressed: () {
                setState(() {
                  searchActive = true;
                });
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          if (searchActive)
            Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 160,
                      color: Colors.white,
                      child: TextField(
                        cursorColor: Colors.green,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            simple.searchString = value.toLowerCase();
                          });
                        },
                      )),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        searchActive = true;
                        _onItemTapped(3);
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        searchActive = false;
                        _onItemTapped(0);
                      });
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          if (!searchActive)
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
              ),
            ),
          if (!searchActive)
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

    //http.StreamedResponse response = await request.send();

    // var jsonResponse =
    //     convert.jsonDecode(await response.stream.bytesToString());
    List<item> items = [];
    // //ignore: avoid_types_as_parameter_names
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
