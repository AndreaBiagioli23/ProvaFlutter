import 'package:flutter/material.dart';


void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  MyApp({super.key});



@override
  State<MyApp> createState() => _MyAppState();
   
  }

  class _MyAppState extends State<MyApp> {
    final _messangerKey=GlobalKey<ScaffoldMessengerState>();

    @override
    Widget build(BuildContext context){
      return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Demo App"),
          ),
          body: Center(
            child: Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text("LR"),
              ),
              label: const Text("Luca Rossi")
              ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
           showDialog(context: context, builder: (context){
              return SimpleDialog(
                title: Text("Bellissimo dialog"),
                children: [
                  SimpleDialogOption(
                    onPressed: () {},
                    child: Text("Prima Opzione"),
                  ),
                  SimpleDialogOption(
                    onPressed: () {},
                    child: Text("Seconda Opzione"),
                  ),
                ],
              );
           
          });
       
    }),
      ));
      
  }

  }