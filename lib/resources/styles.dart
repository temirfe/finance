import 'package:flutter/material.dart';

Padding padh(Widget child, double pad) {
  return Padding(padding: EdgeInsets.symmetric(horizontal: pad), child: child);
}

Padding padh16(Widget child) {
  return padh(child, 16.0);
}

Text textH6(BuildContext context, String str) {
  return Text(str, style: Theme.of(context).textTheme.headline6);
}

Text textS1(BuildContext context, String str) {
  return Text(str, style: Theme.of(context).textTheme.subtitle1);
}

Text textCaption(BuildContext context, String str) {
  return Text(str, style: Theme.of(context).textTheme.caption);
}

Text textWhite(String str) {
  return Text(str, style: TextStyle(color: Colors.white));
}

Text textGrey(String str) {
  return Text(str, style: TextStyle(color: Colors.grey[600]));
}

Text textRed(String str) {
  return Text(str, style: TextStyle(color: Colors.red));
}

Text textGreen(String str) {
  return Text(str, style: TextStyle(color: Colors.green[600]));
}

Text textLink(String str, {double size}) {
  TextStyle ts = TextStyle(color: Colors.blue[300]);
  if (size != null) {
    ts = TextStyle(color: Colors.blue[300], fontSize: size);
  }
  return Text(str, style: ts);
}

Text textSize(String str, double size) {
  return Text(str, style: TextStyle(fontSize: size));
}

Widget text15(String v) {
  return Text(v, style: TextStyle(fontSize: 15.0));
}

Widget text16(String v) {
  return Text(v, style: TextStyle(fontSize: 16.0));
}

Widget textBold(String v) {
  return Text(v, style: TextStyle(fontWeight: FontWeight.bold));
}

Widget textBold15(String t) {
  return Text(t, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0));
}
