import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../_setting.dart';
import '../_setting.dart';
import '../_setting.dart';
import 'item_page.dart';

// ignore: use_key_in_widget_constructors
class HomeActivity extends StatefulWidget {
  @override
  HomePageActivity createState() => HomePageActivity();
}

class HomePageActivity extends State<HomeActivity> {
  static const text = "your tasks";
  List<item> items = [];

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

    var jsonResponse =
        convert.jsonDecode(await response.stream.bytesToString());
    setState(() {
      flag = true;

      jsonResponse['items'].forEach((element) {
        item i = item(
            element["itemID"],
            element["productID"],
            element["sellerDetails"],
            element["sellerLocation"][0],
            element["sellerLocation"][1],
            element["itemImageUrl"],
            element["itemDetails"],
            element["category"],
            element["price"],
            element["locationName"],
            element["sub_category"]);
        items.add(i);
      });
      simple.items = items;
      print(items.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return flag
        ? GridView.count(
            children: simple.currentPageIndex == 0
                ? items
                    .where((element) =>
                        simple.preferredItem.contains(element.category))
                    .where((element) =>
                        element.price >= simple.minPriceRange &&
                        element.price <= simple.maxPriceRange)
                    .map((e) => itemCard(e))
                    .toList()
                : simple.currentPageIndex == 2
                    ? items
                        .where((element) =>
                            simple.wishListItemKey.contains(element.itemID))
                        .map((e) => itemCard(e))
                        .toList()
                    : simple.currentPageIndex == 1
                        ? items
                            .where((element) =>
                                simple.preferredItem.contains(element.category))
                            .where((element) =>
                                element.price >= simple.minPriceRange &&
                                element.price <= simple.maxPriceRange)
                            .map((e) => itemCard(e))
                            .toList()
                        : items
                            .where((element) =>
                                simple.searchString == element.itemDetails)
                            .map((e) => itemCard(e))
                            .toList(),
            crossAxisCount: 2,
          )
        : const Text("loading");
  }
}

class itemCard extends StatelessWidget {
  item itemData;

  itemCard(this.itemData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        simple.currentItem = itemData;
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => items()),
        );
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 170,
              child: Image(
                image: NetworkImage(itemData.itemImageUrl),
                height: 190,
                width: 190,
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                itemData.itemDetails + " - Rs." + itemData.price.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )
            ])
          ],
        ),
      ),
    );
  }
}
