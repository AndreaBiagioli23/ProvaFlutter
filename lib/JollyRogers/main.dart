import 'package:flutter/material.dart';
import 'package:flutter_application_1/JollyRogers/componenti.dart';
import 'package:flutter_application_1/JollyRogers/inserisciPrenotazione.dart';


void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(),
      // Spostiamo tutto il contenuto in una classe separata chiamata HomePage
      home: const HomePage(), 
    );
  }
}

// Creiamo una classe dedicata per la Home
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ORA questo context è "sotto" MaterialApp e il Navigator funzionerà!
    return Scaffold(
      appBar: miaAppBar(context, mostraImpostazioni: true), // Qui vogliamo l'icona
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("images/logo.png"),
              radius: 50,
            ),
            const SizedBox(height: 30),
            const Text(
              "Benvenuto",
              style: TextStyle(
                color: Color.fromARGB(255, 23, 93, 142),
                fontSize: 40,
                fontFamily: "EBGaramond",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Hai una prenotazione? Fai il check-in qui in pochi secondi!",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:  (context) => const Inserisciprenotazione()));
              },
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
              label: const Text("Inizia il Check-in", style: TextStyle(color: Colors.white)),
              iconAlignment: IconAlignment.end,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 23, 93, 142),
                fixedSize: const Size(400, 40),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}