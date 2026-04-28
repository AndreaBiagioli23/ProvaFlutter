import 'package:flutter/material.dart';


class Primapagina extends StatelessWidget {
  const Primapagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter demo App'),
      ),
     body: Column(
       children: [
         Text('Prima pagina',style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
         ElevatedButton(onPressed: () {
          Navigator.pushNamed(context, '/seconda',arguments: 'beubeiee');

         },
          child: Text("Cambia Pagina"))
       ],
     ),
     
    floatingActionButton : FloatingActionButton(
      onPressed: () {},
    ),
    );
  }
}