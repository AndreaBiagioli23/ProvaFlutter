import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<int> lista = [1,2,3,4,5,6,7,8,9,10];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.access_time))
        ],
      ),

      body: SizedBox(
        height: 690,
        width: 600,
        
        child: Card(
          margin: EdgeInsets.all(10),
          shadowColor: Colors.red,
          elevation: 30,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          
          child: Column(
            children: [
              Image.asset("images/immagine.jpg"),
              const ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage("https://i.pravatar.cc/300")),
                title: Text("Ciao come stai"),
                subtitle: Text("Tutto bene tu?"),
                trailing: Icon(Icons.data_saver_off_outlined),

              )
            ],
          ),
        ),

      ),
      // GridView.count(crossAxisCount: 3,
      // mainAxisSpacing: 8,
      // crossAxisSpacing: 8,
      //  children: [
      //   for(var i in lista)
      //   Container(
      //   

      //   )
      // ],),
      
      
        
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}