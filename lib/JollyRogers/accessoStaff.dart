import 'package:flutter/material.dart';
import 'package:flutter_application_1/JollyRogers/componenti.dart';
import 'package:flutter_application_1/JollyRogers/config.dart';

enum StatoPin { neutro, corretto, errato }

class Accessostaff extends StatefulWidget {
  const Accessostaff({super.key});

  @override
  State<Accessostaff> createState() => _StatoStaff();
}

class _StatoStaff extends State<Accessostaff> {
  int numeroCifreInserite = 0;
  StatoPin statoAttuale = StatoPin.neutro;
  String pinDigitato = ""; // Variabile per memorizzare le cifre

  void _aggiungiCifra(String numero) {
    setState(() {
      if (numeroCifreInserite < 4) {
        pinDigitato += numero; // Aggiunge il numero alla stringa
        numeroCifreInserite++;

        // Controllo automatico quando arriviamo a 4
        if (numeroCifreInserite == 4) {
          _controllaPin();
        }
      }
    });
  }

  void _controllaPin() {
    if (pinDigitato == "0000") {
      statoAttuale = StatoPin.corretto;
      // 1. Aspetta 3 secondi
      Future.delayed(const Duration(seconds: 3), () {
        // 2. Controlla se il widget è ancora montato (sicurezza Flutter)
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ConfigurazionePage()),
          );
        }
      });
      // Qui aggiungerai l'azione successiva (es: navigazione)
    } else {
      statoAttuale = StatoPin.errato;
      // Qui potresti aggiungere un reset o un messaggio di errore
    }
  }

  void _resetPin() {
    setState(() {
      numeroCifreInserite = 0;
      pinDigitato = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    // Niente MaterialApp qui!
    return Scaffold(
      appBar: miaAppBar(
        context,
        mostraImpostazioni: false,
        mostraIndietro: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: statoAttuale == StatoPin.corretto
                    ? Color.fromARGB(255, 10, 162, 15)
                    : (statoAttuale == StatoPin.errato
                          ? const Color.fromARGB(255, 156, 15, 5)
                          : const Color.fromARGB(255, 23, 93, 142)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2, // Quanto si "allarga" l'ombra
                    blurRadius: 7, // Quanto è "sfumata" l'ombra
                    // Spostamento: (orizzontale, verticale)
                  ),
                ],
              ),
              child: Icon(
                statoAttuale == StatoPin.corretto
                    ? Icons.lock_open
                    : Icons.lock_outline_sharp,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Acesso Staff",
              style: TextStyle(
                color: Color.fromARGB(255, 23, 93, 142),
                fontFamily: "EBGaramond",
                fontSize: 40,
              ),
            ),
            Text(
              "Inserisci il PIN per accedere \n alle impostazioni",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "EBGaramond",
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Per centrarli nella riga
              children: List.generate(4, (index) {
                // index va da 0 a 3
                bool isRiempito = index < numeroCifreInserite;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // Se è riempito usa il colore blu, altrimenti solo il bordo
                    color: isRiempito
                        ? (statoAttuale == StatoPin.corretto
                              ? const Color.fromARGB(255, 10, 162, 15)
                              : (statoAttuale == StatoPin.errato
                                    ? Color.fromARGB(255, 156, 15, 5)
                                    : const Color.fromARGB(255, 23, 93, 142)))
                        : Colors.transparent,
                    border: Border.all(
                      color: statoAttuale == StatoPin.corretto
                          ? Color.fromARGB(255, 10, 162, 15)
                          : (statoAttuale == StatoPin.errato
                                ? Color.fromARGB(255, 156, 15, 5)
                                : const Color.fromARGB(255, 23, 93, 142)),
                      width: 2,
                    ),
                  ),
                );
              }),
            ),

            if (statoAttuale != StatoPin.neutro)
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: statoAttuale == StatoPin.corretto
                        ? Colors.green
                        : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      statoAttuale == StatoPin.corretto
                          ? Icons.check_circle
                          : Icons.error_outline,
                      color: statoAttuale == StatoPin.corretto
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      statoAttuale == StatoPin.corretto
                          ? "Accesso effettuato. Benvenuto!"
                          : "PIN non corretto. Riprova!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: statoAttuale == StatoPin.corretto
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 12),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tastoNumerico("1", () => _aggiungiCifra("1")),
                    tastoNumerico("2", () => _aggiungiCifra("2")),
                    tastoNumerico("3", () => _aggiungiCifra("3")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tastoNumerico("4", () => _aggiungiCifra("4")),
                    tastoNumerico("5", () => _aggiungiCifra("5")),
                    tastoNumerico("6", () => _aggiungiCifra("6")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tastoNumerico("7", () => _aggiungiCifra("7")),
                    tastoNumerico("8", () => _aggiungiCifra("8")),
                    tastoNumerico("9", () => _aggiungiCifra("9")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 86,
                    ), // Spazio per allineare lo 0 sotto l'8
                    tastoNumerico("0", () => _aggiungiCifra("0")),
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: 70,
                      height: 70,
                      child: IconButton(
                        icon: const Icon(
                          Icons.backspace,
                          color: Color.fromARGB(255, 23, 93, 142),
                        ),
                        onPressed: () {
                          setState(() {
                            if (numeroCifreInserite > 0) {
                              numeroCifreInserite--;
                              pinDigitato = pinDigitato.substring(
                                0,
                                pinDigitato.length - 1,
                              );
                              statoAttuale = StatoPin
                                  .neutro; // <--- AGGIUNTO: torna neutro
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget tastoNumerico(String numero, VoidCallback onPressed) {
  return Container(
    margin: const EdgeInsets.all(8),
    width: 110,
    height: 70,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
          color: Color.fromARGB(255, 23, 93, 142), // Colore del bordo
          width: 2.0, // Spessore del bordo (puoi aumentare a 3.0, 4.0, ecc.)
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),

          // Angoli smussati
        ),
      ),
      onPressed: onPressed,
      child: Text(
        numero,
        style: const TextStyle(fontSize: 24, color: Colors.black),
      ),
    ),
  );
}
