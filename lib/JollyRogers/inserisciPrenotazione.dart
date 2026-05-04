import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/JollyRogers/ProgressStepper.dart';
import 'package:flutter_application_1/JollyRogers/componenti.dart';

void main(List<String> args) {
  runApp(const Inserisciprenotazione());
}

class Inserisciprenotazione extends StatefulWidget {
  const Inserisciprenotazione({super.key});

  @override
  State<Inserisciprenotazione> createState() => _StatoPrenotazione();
}

class _StatoPrenotazione extends State<Inserisciprenotazione> {
  final TextEditingController _controller = TextEditingController();
  bool _isVuota = true; // Per l'asterisco

  // Ascoltiamo cosa su
  // @override
  void initState() {
    super.initState(); // ccede nella TextField

    _controller.addListener(() {
      setState(() {
        _isVuota = _controller.text.isEmpty;
        // Opzionale: se l'utente ricomincia a scrivere,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miaAppBar(
        context,
        mostraImpostazioni: false,
        mostraIndietro: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            ProgresStepper(totalSteps: 3, currentStep: 0),
            const SizedBox(height: 25),
            Text(
              "Inserire il codice di conferma",
              style: TextStyle(
                color: Color.fromARGB(255, 23, 93, 142),
                fontFamily: "EBGaramond",
                fontSize: 40,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Il numero di prenotazione può essere nell'email di conferma ricevuta al momento della prenotazione.",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "EBGaramond",
                fontSize: 17,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "NUMERO PRENOTAZIONE",
                  style: TextStyle(color: Colors.grey, letterSpacing: 2),
                ),
                SizedBox(width: 5),
                if (_isVuota) Text("*", style: TextStyle(color: Colors.red)),
              ],
            ),
            SizedBox(height: 5),
            TextField(
              textAlign: TextAlign.center, // Centra verticalmente il testo
              controller: _controller,
              style: const TextStyle(
                color: Color.fromARGB(
                  255,
                  23,
                  93,
                  142,
                ), // O il colore che preferisci per il testo scritto
                fontSize: 45, // DEVE ESSERE UGUALE AL fontSize di hintStyle
                //fontWeight: FontWeight.normal,
                letterSpacing: 10.0,
              ),
              decoration: InputDecoration(
                hintText: "es : 2 0 1 1 4",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 45),
                filled: true,
                fillColor: Colors.grey[100],
                // BORDO PIÙ SPESSO QUANDO NON CLICCATO
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 4.5,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                // BORDO PIÙ SPESSO QUANDO CLICCATO
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 23, 93, 142),
                    width: 4.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // 1. Definisci il bordo superiore grigio
  decoration: const BoxDecoration(
    color: Colors.white, // Sfondo del "pannello"
    border: Border(
      top: BorderSide(
        color: Colors.grey, // Colore del bordo
        width: 0.5,         // Spessore sottile ed elegante
      ),
    ),
  ),
        
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        
          child: ElevatedButton(
            onPressed: () {},
        
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 23, 93, 142),
              padding: const EdgeInsets.symmetric(vertical: 30),
              // --- AGGIUNGI QUESTA PARTE ---
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  25,
                ), // Cambia 10 con il valore che preferisci
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centra tutto il blocco
              children: [
                Text(
                  "Avanti",
        
                
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(width: 10),
                Icon(Icons.chevron_right, color: Colors.white, size: 25),
              ],
            ),
          ),
        ),
      
    );
  }
}
