// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:const <Widget>[
        Text(
        "Hello Miraj",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 70.0,
          color: Colors.white,
        ),
        ),
        Text(
        "Hello Miraj",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 70,
          color: Colors.white,
        ),
        ),
        Text(
        "Hello Miraj",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 70,
          color: Colors.white,
        ),
        ),
        Text(
        "Hello Miraj",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 70,
          color: Colors.white,
        ),
        ),
        Text(
        "Hello Miraj",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 70,
          color: Colors.white,
        ),
        ),
        Text(
        "Hello Miraj",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 70,
          color: Colors.white,
        ),
        ),
        ]
        // child: Container(
        //   width: 300,
        //   height: 700,
        //   padding: EdgeInsets.all(16),

          
        //   child: Column(
        //     children: const <Widget>[
        //       Text(
        //         "Hello miraj",
        //         textDirection: TextDirection.ltr,
        //         style: TextStyle(
        //         decoration: TextDecoration.none,
        //         fontSize: 70.0,
        //         color: Colors.white)
        //         ),
        //       Text(
        //         "Hello miraj",
        //         textDirection: TextDirection.ltr,
        //         style: TextStyle(
        //         decoration: TextDecoration.none,
        //         fontSize: 70,
        //         color: Colors.white)
        //         ),
        //       Text(
        //         "Hello miraj",
        //         textDirection: TextDirection.ltr,
        //         style: TextStyle(
        //         decoration: TextDecoration.none,
        //         fontSize: 70.0,
        //         color: Colors.white)
        //         ),
        //         Text(
        //         "Hello miraj",
        //         textDirection: TextDirection.ltr,
        //         style: TextStyle(
        //         decoration: TextDecoration.none,
        //         fontSize: 70.0,
        //         color: Colors.white)
        //         ),
        //         Text(
        //         "Hello miraj",
        //         textDirection: TextDirection.ltr,
        //         style: TextStyle(
        //         decoration: TextDecoration.none,
        //         fontSize: 70.0,
        //         color: Colors.white)
        //         ),
        //         Text(
        //         "Hello miraj",
        //         textDirection: TextDirection.ltr,
        //         style: TextStyle(
        //         decoration: TextDecoration.none,
        //         fontSize: 70.0,
        //         color: Colors.white)
        //         ),
        //         Text(
        //         "Hello miraj",
        //         textDirection: TextDirection.ltr,
        //         style: TextStyle(
        //         decoration: TextDecoration.none,
        //         fontSize: 70.0,
        //         color: Colors.white)
        //         ),
        //     ],
            
        //   ),
        // ),
      
      //  This trailing comma makes auto-formatting nicer for build methods.
    );

    
  }
}
