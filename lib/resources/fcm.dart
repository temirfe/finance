import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'session.dart';

class Fcm {
  final BuildContext context;
  static Fcm _singleton;

  factory Fcm(BuildContext ctx) {
    if (_singleton == null) {
      _singleton = new Fcm._internal(ctx);
    }
    return _singleton;
  }

  Fcm._internal(this.context);

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  GlobalKey<NavigatorState> _nav;

  /* void firebaseCloudMessagingListeners(
      GlobalKey<NavigatorState> navigatorKey, Function shln)  */
  void firebaseCloudMessagingListeners(GlobalKey<NavigatorState> navigatorKey) {
    _nav = navigatorKey;
    if (Platform.isIOS) iosPermission();

    checkToken();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        cprint('onMessage $message');
        doAction(message, 'onMessage');
      },
      onResume: (Map<String, dynamic> message) async {
        cprint('onResume $message');
        doAction(message, 'onResume');
      },
      onLaunch: (Map<String, dynamic> message) async {
        cprint('onLaunch $message');
        doAction(message, 'onLaunch');
      },
    );
  }

  void checkToken() {
    var token = session.getString('fcm_token');
    //cprint('FCM session token: $token');
    var userId = session.getInt('userId');
    if (token == null && userId != null) {
      saveToken();
    }
  }

  void saveToken() {
    String plat = 'other';
    if (Platform.isAndroid) {
      plat = 'Android';
    } else if (Platform.isIOS) {
      plat = 'ios';
    }

    _firebaseMessaging.getToken().then((token) async {
      String prevToken = session.getString('fcm_token');
      if (prevToken == null || prevToken != token) {
        cprint('saveToken fcm token: $token');
        session.setString('fcm_token', token);
        cprint('sending fcm token to server');
        Map<String, dynamic> mappy = {
          'user_id': session.getInt('userId'),
          'token': token,
          'platform': plat,
          'action': 'save',
        };

        //saveFcm(mappy);
      }
    });
  }

  void deleteToken() {
    String sesToken = session.getString('fcm_token');
    int userID = session.getInt('userId');
    Future<bool> deleted = _firebaseMessaging.deleteInstanceID();
    deleted.then((v) async {
      cprint('token deleted $v');
      if (v) {
        //delete from server
        if (sesToken != null &&
            sesToken.length > 0 &&
            userID != null &&
            userID != 0) {
          Map<String, dynamic> mappy = {
            'user_id': userID,
            'token': sesToken,
            'action': 'delete'
          };

          //saveFcm(mappy);
        }
      }
    });
  }

  void doAction(Map<String, dynamic> message, String from) {
    Map dataLoad;
    Map notifInfo;

    if (message != null) {
      if (message.containsKey('data')) {
        dataLoad = message['data'];
      } else {
        dataLoad = message;
      }

      if (message.containsKey('aps')) {
        notifInfo = message['aps']['alert'];
      } else {
        notifInfo = message['notification'];
      }

      if (dataLoad.containsKey('chat_id')) {
        chatAction(dataLoad, from);
      }
    } else {
      cprint('Firebase msg is null');
    }

    if (from == 'onMessage') {
    } else {
      //icon badge counter
      /* Future<bool> canBadge = FlutterAppBadger.isAppBadgeSupported();
      canBadge.then((b) {
        if (b) {
          FlutterAppBadger.updateBadgeCount(1);
        }
      }); */
    }
  }

  chatAction(Map dataLoad, String from) {
    cprint('chatAction $dataLoad');
  }

  void iosPermission() {
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(
        sound: true, badge: true, alert: true, provisional: false));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      cprint("Settings registered: $settings");
    });
  }
}
