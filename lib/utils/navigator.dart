import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {bool replace = false}) {
  if (replace) {
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

bool pop(BuildContext context, String text) {
  return Navigator.pop(context, text);
}
