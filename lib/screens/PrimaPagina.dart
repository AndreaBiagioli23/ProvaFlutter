import 'dart:math';

import 'package:flutter/material.dart';


class Primapagina extends StatefulWidget {
  const Primapagina({super.key});

  @override
  State<Primapagina> createState() => _PrimapaginaState();
}

class _PrimapaginaState extends State<Primapagina> {
  double _height=300;
  double _padding=8;

  double _width=300;

  Color _color= Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter demo App'),
      ),
     body: Padding(
      //duration: const Duration(seconds: 1),
      padding: EdgeInsets.symmetric(horizontal:8.0,vertical:150) ,
       child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/seconda',arguments: 'Corso Flutter');
        },
         child: Column(
           children: [
            SizedBox(
              height: 420,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: [
                    Hero(tag:'ImmagineCopertina',child: Image.asset('images/immagine.jpg',width: 400,)),
                    Text("Corso Flutter",style: TextStyle(fontSize: 25),),
         
                  ]
                  
                ),
              ),
         
            )
            //  Text('Prima pagina',style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
            //  ElevatedButton(onPressed: () {
            //   Navigator.pushNamed(context, '/seconda',arguments: 'beubeiee');
         
            //  },
            //   child: Text("Cambia Pagina")),
            //   AnimatedContainer(
            //     width: _width,
            //     height: _height,
            //     color: _color,
            //     duration: const Duration(seconds: 1),
            //     curve : Curves.fastOutSlowIn
            //   )
           ],
         ),
       ),
     ),
     
    floatingActionButton : FloatingActionButton(
      onPressed: () {},
    ),
    );
  }
}