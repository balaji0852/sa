import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sa/Pages/home_page.dart';

import '../_home.dart';
import '../_setting.dart';

class items extends StatefulWidget {
  //item itemData;

  // items(this.itemData, Key? key) : super(key: key);

  @override
  itemsPage createState() => itemsPage();
}

class itemsPage extends State<items> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 50,
              // ),
              IconButton(
                  onPressed: route,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 40,
                  )),
              const SizedBox(
                height: 20,
              ),
              Image(
                image: NetworkImage(simple.currentItem!.itemImageUrl),
                height: 450,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                simple.currentItem!.itemDetails +
                    "  Rs." +
                    simple.currentItem!.price.toString(),
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: const Text("Buy now"),
                    color: Colors.green[50],
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text("Take me to store"),
                    color: Colors.green,
                    height: 50,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          flag = !flag;
                        });
                        if (simple.wishListItemKey
                            .contains(simple.currentItem!.itemID)) {
                          simple.wishListItemKey
                              .remove(simple.currentItem!.itemID);
                        } else {
                          simple.wishListItemKey
                              .add(simple.currentItem!.itemID);
                          print("add");
                        }
                      },
                      icon: Icon(
                        Icons.star,
                        size: 35,
                        color: simple.wishListItemKey
                                    .contains(simple.currentItem!.itemID) &&
                                flag != !flag
                            ? Colors.green
                            : Colors.green[100],
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "product id : " + simple.currentItem!.productID,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "seller details : " + simple.currentItem!.sellerDetails,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "similar items",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: simple.items
                      .where((element) =>
                          element.sub_category ==
                              simple.currentItem!.sub_category &&
                          simple.currentItem!.category == element.category)
                      .map((e) => itemCard(e))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void route() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }
}
