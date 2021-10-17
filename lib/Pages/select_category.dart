import 'package:flutter/material.dart';
import 'package:sa/_home.dart';
import 'package:sa/_setting.dart';

// ignore: use_key_in_widget_constructors
class SelectCategory extends StatefulWidget {
  @override
  Category createState() => Category();
}

class Category extends State<SelectCategory> {
  List<String> categories = ["pant", "shirt", "shoe"];
  List<String> cities = ["bangalore"];
  List<String> preferredCities = ["flag"];
  List<String> preferredItem = ["flag"];

  double mincurrentSliderValue = 299;
  double maxcurrentSliderValue = 1000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      mincurrentSliderValue = simple.minPriceRange;
      maxcurrentSliderValue = simple.maxPriceRange;
      preferredCities = simple.preferredCities;
      preferredItem = simple.preferredItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  "select categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: categories
                        .map(
                          (item) => GestureDetector(
                            onTap: () {
                              if (preferredItem.contains(item)) {
                                setState(() {
                                  preferredItem.remove(item);
                                });
                              } else {
                                setState(() {
                                  preferredItem.add(item);
                                });
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                height: 50,
                                width: 120,
                                color: preferredItem.contains(item)
                                    ? Colors.green
                                    : Colors.green[50],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const Text(
                  "select city",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: cities
                        .map(
                          (item) => GestureDetector(
                            onTap: () {
                              if (preferredCities.contains(item)) {
                                setState(() {
                                  preferredCities.remove(item);
                                });
                              } else {
                                setState(() {
                                  preferredCities.add(item);
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 50,
                                width: 120,
                                color: preferredCities.contains(item)
                                    ? Colors.green
                                    : Colors.green[50],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const Text(
                  "select price range",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "min",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                Slider(
                  value: mincurrentSliderValue,
                  min: 200,
                  max: 1000,
                  divisions: 8,
                  activeColor: Colors.green,
                  inactiveColor: Colors.green[50],
                  label: mincurrentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      mincurrentSliderValue = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "max",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                Slider(
                  value: maxcurrentSliderValue,
                  min: 200,
                  max: 1000,
                  divisions: 8,
                  activeColor: Colors.green,
                  inactiveColor: Colors.green[50],
                  label: maxcurrentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      maxcurrentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
            Container(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {
                      route();
                    },
                    color: Colors.green,
                    child: const Text(
                      "next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  MaterialButton(
                    onPressed: () {
                      route();
                    },
                    child: const Text(
                      "skip",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Scrollbar(
  //     child: SingleChildScrollView(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           const SizedBox(
  //             height: 30,
  //           ),

  //           ListView(
  //             children: [
  //               const Text(
  //                 "select category",
  // style: ,
  //               ),
  //               GridView.count(
  //                   crossAxisCount: 3,
  //                   children: categories
  //                       .map(
  //                         (e) => Padding(
  //                           padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
  //                           child: ElevatedButton(
  //                             onPressed: () {},
  //                             child: Text(e),
  //                           ),
  //                         ),
  //                       )
  //                       .toList())
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   ));
  // }

  void route() {
    print(
        "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''");
    simple.minPriceRange = mincurrentSliderValue;
    simple.maxPriceRange = maxcurrentSliderValue;
    simple.preferredCities = preferredCities;
    simple.preferredItem = preferredItem;

    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }
}

//  body: GridView.count(
//             crossAxisCount: 3,
//             mainAxisSpacing: 0,
//             crossAxisSpacing: 0,
//             children: categories
//                 .map((e) => Padding(
//                       padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
//                       child: ElevatedButton(onPressed: () {}, child: Text(e)),
//                     ))
//                 .toList())

//                 const SizedBox(height: 55),

//             const SizedBox(height: 30),


