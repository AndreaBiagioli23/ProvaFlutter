import 'package:flutter/material.dart';


class Secondapagina extends StatelessWidget {
  const Secondapagina({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter demo App'),
      ),
      body: Column(
        children: [
          Hero(tag:'ImmagineCopertina',child: Image.asset('images/immagine.jpg',width: 400,)),
          Text(data,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        
             ],
      ),
     
    floatingActionButton : FloatingActionButton(
      onPressed: () {},
    ),
    );
  }
}