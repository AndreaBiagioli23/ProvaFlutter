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
          Text('Seconda pagina',style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
          Text(data,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
           ElevatedButton(onPressed: () {
         Navigator.pushNamed(context, '/prima');
      
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