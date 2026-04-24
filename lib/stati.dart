

import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter =0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // <--- COSA AGGIUNTA PER TOGLIERE IL BANNER
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Sera a tutti"),),
        body: Center(
          child: Text('$counter',style: TextStyle(fontSize: 45,fontWeight: FontWeight.w700),),
        ),
        floatingActionButton: FloatingActionButton(onPressed : (
          
        ) { 
          setState(() {
            ++counter;
          });
          
          print(counter); },
        child: Icon(Icons.abc),),

      )
    );
  }
}


      
      