import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:finance/resources/fcm.dart';
export 'styles.dart';
export 'strings.dart';

SharedPreferences session;
sessionSaveAuth(Map<String, dynamic> map) {
  session.setInt('userId', map['id']);
  //session.setInt('roleId', map['role_id']);
  session.setString('fullName', map['name']);
  session.setString('authKey', map['auth_key']);
  session.setString('email', map['email']);
  session.setInt('account', map['account']);
  session.setInt('locationId', myGetInt(map['location_id']));
  session.setString('phone', map['phone']);
  //session.setString('image', map['thumbnailPicture']);
  if (map['name'] != null) {
    List<String> spl = map['name'].split(" ");
    String initials = spl[0].substring(0, 1).toUpperCase();
    if (spl.length > 1) {
      initials += spl[1].substring(0, 1).toUpperCase();
    }
    session.setString('name', spl[0]);
    session.setString('initials', initials);
  }
  Fcm(null).saveToken();
}

int myGetInt(dynamic v) {
  if (v == null) {
    return null;
  } else if (v is int) {
    return v;
  } else {
    return int.parse(v);
  }
}

cprint(String msg) {
  AnsiPen pen = new AnsiPen()
    ..white()
    ..rgb(r: 1.0, g: 0.8, b: 0.2);

  print(pen(msg));
}

bool empty(dynamic v) {
  if (["", null, false, 0].contains(v)) {
    return true;
  }
  return false;
}

Text mytext = Text('asdf',
    style: TextStyle(
        color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.bold));
