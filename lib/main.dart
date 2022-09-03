//import 'dart:ffi';

import 'package:drivers_app/splashScreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';




  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  options: FirebaseOptions(apiKey: "AIzaSyDAhQ7AWnKWiUx_lNhb-TC8zpDCqGPSt8o", appId: "1:1088836072448:android:293c465622bd6ba7de14e5", messagingSenderId: "1088836072448", projectId: "uber-ola-and-indriver-cl-fe98a",
  databaseURL: "https://uber-ola-and-indriver-cl-fe98a-default-rtdb.firebaseio.com",
  authDomain: 'localhost',
  ),
  );
  runApp(
    MyApp(
      child:   MaterialApp(
      title: 'Drivers App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MySplashScreen(),
      debugShowCheckedModeBanner: false
      )
    )
  );

    
      
    
    
  
}

class MyApp extends StatefulWidget {
  final Widget? child;
  MyApp({this.child});
  static void restartApp(BuildContext context){
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }
  //const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Key key = UniqueKey();
  void restartApp(){
    setState(() {
    key =   UniqueKey();
    });
  }
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
    child: widget.child!,
    );
    
  }
}

