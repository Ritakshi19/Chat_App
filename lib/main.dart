import 'package:chat_app/Screens/HomeScreen.dart';
import 'package:chat_app/firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main(){
  initializeFirebase();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen()));
}

Future initializeFirebase() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}
