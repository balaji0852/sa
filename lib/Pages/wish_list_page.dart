// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class wishListPage extends StatefulWidget {
  @override
  Wish createState() => Wish();
}

class Wish extends State<wishListPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("wishlist");
  }
}
