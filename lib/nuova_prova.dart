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

      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: lista.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8,mainAxisSpacing: 8), itemBuilder: (context, index){
        return Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text('$index')

        );
      }),
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