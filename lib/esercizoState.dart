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
  bool isFavourite = false;

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onDoubleTap: () {
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
              child: SizedBox(
                height: 300,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 8.0,
                  shadowColor: Colors.green,
                  child: Stack(children: [
                     Image.asset('images/immagine.jpg',fit: BoxFit.fitHeight,),
                     Positioned(top:10,right:30,
                     child: isFavourite ? const Icon(Icons.favorite,color:Colors.red) : const Icon(Icons.favorite_outline))
                  ],)
                 
                
                  ),
                  
                )
                
                ),
              ),
            ),
          ),
        );
        
    
    
  }
}

