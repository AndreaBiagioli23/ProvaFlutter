import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/PaginaErrore.dart';
import 'package:flutter_application_1/screens/SecondaPagina.dart';
import 'package:flutter_application_1/screens/PrimaPagina.dart';

class Routegenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args= settings.arguments;
    switch(settings.name){
      case '/prima':
        return MaterialPageRoute(builder: (context) => Primapagina());
      case '/seconda':
        if(args is String){
          return MaterialPageRoute(builder: (context) => Secondapagina(data: args));

        }
        return MaterialPageRoute(builder: (context) => PaginaErrrore());
      default:
        return MaterialPageRoute(builder: (context) => PaginaErrrore());
    }

  }
}
