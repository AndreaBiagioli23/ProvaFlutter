import 'package:flutter/material.dart';


class PaginaErrrore extends StatelessWidget {
  const PaginaErrrore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter demo App'),
      ),
     body: Column(
       children: [
         Text('Errore',style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
     
       ],
     ),
     
    floatingActionButton : FloatingActionButton(
      onPressed: () {},
    ),
    );
  }
}