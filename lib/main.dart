import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_app/drive_app.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoContext.clientId = 'e8bf54a920a92a14134c1b4f2e52610d';
  Provider.debugCheckInvalidValueType = null;
  runApp(const DriveApp());
}
