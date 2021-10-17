import 'package:flutter/cupertino.dart';

// ignore: use_key_in_widget_constructors
class SuggestionPage extends StatefulWidget {
  @override
  Suggestion createState() => Suggestion();
}

class Suggestion extends State<SuggestionPage> {
  static const text = "suggestion";

  @override
  Widget build(BuildContext context) {
    return const Text(text);
  }
}
