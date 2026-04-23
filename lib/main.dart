import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  void _mostraDialogoPassword(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Accesso Admin"),
        content: TextField(
          obscureText: true, // Nasconde i caratteri della password (mette i pallini)
          decoration: const InputDecoration(
            hintText: "Inserisci Password",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Chiude la finestrella
            child: const Text("Annulla"),
          ),
          ElevatedButton(
            onPressed: () {
              // Qui andrebbe il controllo della password, per ora andiamo dritti
              Navigator.pop(context); // Chiude il dialogo
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaginaAdmin()),
              );
            },
            child: const Text("Invia"),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'admin') {
                _mostraDialogoPassword(
                  context,
                ); // Chiamiamo una funzione per la password
              }
            },
            icon: const Icon(Icons.settings),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'admin',
                  child: Text('Accedi come Amministratore'),
                ),
              ];
            },
          ),
        ],
        elevation: 50.0,
        shadowColor: Colors.amber,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text(
              'Welcome to the Hotel!',
              style: TextStyle(
                fontFamily: 'ClimateCrisis',
                color: Colors.red,
                backgroundColor: Colors.lightBlueAccent,
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: 20), // <--- Spazio di 20 pixel
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondaPagina(),
                  ),
                );
              },
              icon: const Icon(Icons.login),
              label: const Text("Check-in", style: TextStyle(fontSize: 30)),

              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                foregroundColor: WidgetStatePropertyAll(Colors.blue),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondaPagina extends StatelessWidget {
  const SecondaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seconda Pagina"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        // Mette tutto al centro dello schermo
        child: SizedBox(
          width:
              400, // <--- Qui decidi quanto deve essere largo il modulo (es. 400 pixel)
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // La colonna occupa solo lo spazio necessario, non tutto lo schermo
            children: [
              Row(
                children: [
                  const SizedBox(width: 80, child: Text("Nome:")),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Inserisci il nome",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 80, child: Text("Cognome:")),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Inserisci il cognome",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class PaginaAdmin extends StatelessWidget {
  const PaginaAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Area Amministratore")),
      body: const Center(child: Text("Benvenuto, Capo!")),
    );
  }
}
