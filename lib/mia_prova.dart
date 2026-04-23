import 'package:flutter/material.dart';

// 1. IL MOTORE (Solo se vuoi lanciarlo da solo col comando 'dart' o 'flutter run')
void main() {
  runApp(const MaterialApp(
    home: MiaInterfaccia(),
  ));
}

// 2. LA TUA INTERFACCIA
class MiaInterfaccia extends StatelessWidget {
   const MiaInterfaccia({super.key});

  final List<int> lista = const [1,2,3,4,5,6,7,8,9,10];

  @override
  Widget build(BuildContext context) {
    // Lo Scaffold è il "foglio bianco" con AppBar e Body
    return Scaffold(
      appBar: AppBar(
        title: const Text("La Mia Nuova Pagina"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              for(var i in lista)
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.grey,
                height: 100,
                margin: EdgeInsets.only(bottom: 8),
                child: Text('$i'),
              )
            ],

          ),
          
          
        ),
      ),
    );
  }
}
