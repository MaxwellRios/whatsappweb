import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsappweb/firebase_options.dart';
import 'package:whatsappweb/telas/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      title: "Whatsapp Web",
      debugShowCheckedModeBanner: false,
      home: Login(),
    ),
  );
}
//579886645281:web:93717e2297d5362d64e360