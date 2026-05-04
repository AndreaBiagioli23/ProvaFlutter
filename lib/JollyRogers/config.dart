import 'package:flutter/material.dart';
import 'package:flutter_application_1/JollyRogers/componenti.dart';

class ConfigurazionePage extends StatefulWidget {
  const ConfigurazionePage({super.key});

  @override
  State<ConfigurazionePage> createState() => _StatoConfig();
}

// DENTRO config.dart
class _StatoConfig extends State<ConfigurazionePage> {
  final TextEditingController _controllerInizio = TextEditingController();
  final TextEditingController _controllerFine = TextEditingController();
  bool _isVuotaInizio = true; // Per l'asterisco
  bool _isVuotaFine = true; // Per l'asterisco

  // Funzione per mostrare il calendario
  Future<void> _selezionaData(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        // Formattiamo la data in GG/MM/AAAA
        controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  final TextEditingController _controller = TextEditingController();
  bool _isVuota = true; // Per l'asterisco
  bool _isSalvato = false; // Per cambiare il bottone e la riga gialla
  bool _isSincronizzato = false;

  @override
  void initState() {
    super.initState(); // <--- CORRETTO: si usa initState, non build!

    // Ascoltiamo cosa succede nella TextField
    _controller.addListener(() {
      setState(() {
        _isVuota = _controller.text.isEmpty;
        // Opzionale: se l'utente ricomincia a scrivere,
        // potresti voler resettare lo stato "salvato"
        if (_controller.text.isNotEmpty) {
          _isSalvato = false;
        }
      });
    });
    // Ascoltatore per Data Inizio
    _controllerInizio.addListener(() {
      setState(() {
        _isVuotaInizio = _controllerInizio.text.isEmpty;
      });
    });

    // Ascoltatore per Data Fine
    _controllerFine.addListener(() {
      setState(() {
        _isVuotaFine = _controllerFine.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // <--- IMPORTANTE: pulisce la memoria
    _controllerInizio.dispose(); // Aggiunto
    _controllerFine.dispose(); // Aggiunto
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // RIMUOVI MaterialApp e theme da qui!
    return Scaffold(
      appBar: miaAppBar(
        context,
        mostraImpostazioni: false,
        mostraIndietro: false
      ), // Qui NON vogliamo l'icona
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white, // Sfondo pulito
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ), // Bordo sottile in basso
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Spinge i figli ai due lati opposti
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Allinea verticalmente al centro
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize
                      .min, // La colonna occupa solo lo spazio necessario
                  children: [
                    Text(
                      "Configurazione",
                      style: TextStyle(
                        color: Color.fromARGB(255, 23, 93, 142),
                        fontFamily: 'EBGaramond',
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "Jolly Roger - Pietra ligure - Staff only",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'EBGaramond',
                      ),
                    ),
                  ],
                ),
                // PARTE DESTRA: Il bottone Esci
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context), // Torna alla Home
                  icon: const Icon(Icons.arrow_back, size: 18),
                  label: const Text("Esci"),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color.fromARGB(255, 23, 93, 142),
                    side: BorderSide(
                      color: Color.fromARGB(255, 23, 93, 142),
                      width: 4.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // 1. MARGIN: Questo crea lo spazio ESTERNO al container (lo stacca dai bordi e sopra)
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),

            // 2. PADDING: Questo crea lo spazio INTERNO (stacca quello che metterai dentro dai bordi del box)
            padding: const EdgeInsets.all(20),

            // Larghezza massima
            width: double.infinity,

            // 3. DECORATION: Qui diamo forma, colore e bordi
            decoration: BoxDecoration(
              color: Colors.white, // Colore di sfondo del box
              borderRadius: BorderRadius.circular(15), // Arrotonda gli angoli
              // Opzionale: aggiungiamo un'ombra per farlo sembrare sollevato

              // Opzionale: un bordino sottile grigio
              border: Border.all(color: Colors.grey.shade300, width: 3),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Qui metterai le tue cose (Form, testi, ecc.)
                Row(
                  children: [
                    Icon(Icons.key, color: Color.fromARGB(255, 23, 93, 142)),
                    const SizedBox(width: 10),
                    Text(
                      "SLOPE API KEY",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Text(
                      "CHIAVE API",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    if (_isVuota) // Appare solo se la TextField è vuota
                      const Text(
                        " *",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),

                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        obscureText: true, // <--- QUESTA è la riga magica
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          hintText: "Incolla qui la tua chiave...",
                          filled: true,
                          fillColor: Colors.grey[100],
                          // BORDO PIÙ SPESSO QUANDO NON CLICCATO
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 2.5,
                            ),
                          ),
                          // BORDO PIÙ SPESSO QUANDO CLICCATO
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 23, 93, 142),
                              width: 3.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // BOTTONE CHE CAMBIA
                    GestureDetector(
                      onTap: () {
                        if (_controller.text.isNotEmpty) {
                          setState(() => _isSalvato = true);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 80,
                        ), // Lo rendiamo più lungo
                        decoration: BoxDecoration(
                          color: _isSalvato
                              ? Colors.transparent
                              : const Color.fromARGB(255, 23, 93, 142),
                          borderRadius: BorderRadius.circular(10),
                          border: _isSalvato
                              ? Border.all(color: Colors.green, width: 2)
                              : null,
                        ),
                        child: _isSalvato
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.check_sharp, color: Colors.green),
                                  Text(
                                    "Salvata",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            : const Icon(Icons.save, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                if (_isSalvato) // Appare solo dopo il click
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check,
                          color: Colors.orangeAccent,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "API Key configurata e memorizzata su questo dispositivo",
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontFamily: 'EBGaramond',
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),

            // 2. PADDING: Questo crea lo spazio INTERNO (stacca quello che metterai dentro dai bordi del box)
            padding: const EdgeInsets.all(20),

            // Larghezza massima
            width: double.infinity,

            // 3. DECORATION: Qui diamo forma, colore e bordi
            decoration: BoxDecoration(
              color: Colors.white, // Colore di sfondo del box
              borderRadius: BorderRadius.circular(15), // Arrotonda gli angoli
              // Opzionale: aggiungiamo un'ombra per farlo sembrare sollevato

              // Opzionale: un bordino sottile grigio
              border: Border.all(color: Colors.grey.shade300, width: 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Color.fromARGB(255, 23, 93, 142),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "SINCRONIZZAZIONE PRENOTAZIONI",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.grey, // Stile base per tutto il testo
                      fontFamily: "EBGaramond",
                    ),
                    children: [
                      const TextSpan(
                        text:
                            "Seleziona il periodo da sincronizzare con Slope. Massimo ",
                      ),
                      TextSpan(
                        text: "2 giorni",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 23, 93, 142),
                          // Colore specifico solo per questa parte
                          fontWeight: FontWeight
                              .bold, // Magari lo mettiamo anche in grassetto per farlo risaltare
                        ),
                      ),
                      const TextSpan(text: " per sincronizzazione."),
                    ],
                  ),
                ),
                SizedBox(height: 11),
                Row(
                  children: [
                    // --- COLONNA DATA INIZIO ---
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Avvolgiamo i due testi in una Row per tenerli affiancati
                          Row(
                            children: [
                              const Text(
                                "DATA INIZIO",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              if (_isVuotaInizio) // L'asterisco ora starà a destra del testo
                                const Text(
                                  " *",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            controller: _controllerInizio,
                            readOnly: true,
                            onTap: () =>
                                _selezionaData(context, _controllerInizio),
                            decoration: InputDecoration(
                              hintText: "GG/MM/AAAA",
                              filled: true,
                              fillColor: Colors
                                  .grey[100], // Sfondo rimane grigio chiaro pulito
                              // --- IL BORDO DINAMICO ---
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  // Se NON è vuota (!), resta BLU, altrimenti torna GRIGIO
                                  color: !_isVuotaInizio
                                      ? const Color.fromARGB(255, 23, 93, 142)
                                      : Colors.grey.shade400,
                                  width: 3.5, // Lo spessore che desideravi
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 23, 93, 142),
                                  width: 3.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 15), // Spazio tra le due colonne
                    // --- COLONNA DATA FINE ---
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "DATA FINE",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              if (_isVuotaFine) // L'asterisco appare solo se è vuota
                                const Text(
                                  " *",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),

                          const SizedBox(height: 5),
                          TextField(
                            controller: _controllerFine,
                            readOnly: true,
                            onTap: () =>
                                _selezionaData(context, _controllerFine),
                            decoration: InputDecoration(
                              hintText: "GG/MM/AAAA",
                              filled: true,
                              fillColor: Colors
                                  .grey[100], // Sfondo rimane grigio chiaro pulito
                              // --- IL BORDO DINAMICO ---
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  // Se NON è vuota (!), resta BLU, altrimenti torna GRIGIO
                                  color: !_isVuotaFine
                                      ? const Color.fromARGB(255, 23, 93, 142)
                                      : Colors.grey.shade400,
                                  width: 3.5, // Lo spessore che desideravi
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 23, 93, 142),
                                  width: 3.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                if(_isSincronizzato)
                Container(
                  width: double.infinity, // Prende tutta la larghezza
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(
                      0.1,
                    ), // Sfondo verde chiarissimo
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.green,
                      width: 3, // Bordi più spessi come hai chiesto
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons
                            .check, // L'icona della "stanghetta giusta" (spunta)
                        color: Colors.green,
                        size: 20,
                      ),
                      const SizedBox(width: 5), // Spazio tra icona e testo
                      Expanded(
                        child: Text(
                          "Scaricate X prenotazioni per X giorni (gg-mm-yyyy)",
                          style: TextStyle(
                            color: Colors
                                .green[800], // Testo verde scuro per leggibilità
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),

                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _isSincronizzato=true;
                      
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 23, 93, 142),
                    minimumSize: const Size(
                      double.infinity,
                      50,
                    ), // <-- Larghezza infinita, altezza 50
                    padding: EdgeInsets.symmetric(vertical: 25),
                  ),

                  icon: Icon(Icons.sync, color: Colors.white),
                  label: Text(
                    "Sincronizza prenotazioni",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
