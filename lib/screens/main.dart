import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/PrimaPagina.dart';
import 'package:flutter_application_1/screens/RouteGenerator.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState()=> _MyAppState();

  }

  class _MyAppState extends State<MyApp> {

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: Primapagina(),
      onGenerateRoute: Routegenerator.generateRoute,
      // routes: {
      //    '/prima' :(context)=> Primapagina(),
      //   '/seconda' :(context)=> Secondapagina(data: "seconda")
      // },
    );
    
  }
  }

  // This widget is the root of your application.
  
