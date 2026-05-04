
import 'package:flutter/material.dart';
import 'package:flutter_application_1/JollyRogers/accessoStaff.dart';
import 'package:flutter_application_1/JollyRogers/config.dart';

AppBar miaAppBar(BuildContext context, {bool mostraImpostazioni = true,bool mostraIndietro = false}) {
  return AppBar(
    
    backgroundColor: const Color.fromARGB(255, 23, 93, 142),
    leadingWidth: 250,
    leading: ListTile(
      contentPadding: const EdgeInsets.only(left: 15),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      leading: const CircleAvatar(
        backgroundImage: AssetImage("images/logo.png"),
      ),
      title: const Text(
        "Jolly Rogers",
        style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: "EBGaramond"),
      ),
      subtitle: const Text(
        "PIETRA LIGURE",
        style: TextStyle(fontSize: 10, color: Colors.white, fontFamily: "EBGaramond"),
      ),
    ),
    actions: [
      // Se mostraIndietro è true, aggiungiamo il tasto e la scritta
      if (mostraIndietro)
        TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          label: const Text(
            "Indietro",
            style: TextStyle(color: Colors.white),
          ),
        ),
      
      const SizedBox(width: 15), // Spaziatura tra indietro e orario
      Center(
        child: Text(
          "${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}",
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        
      ),
      
      // La logica magica: se è true mostra il tasto, se è false non mette nulla
      if (mostraImpostazioni) 
        IconButton(
          icon: const Icon(Icons.settings),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const Accessostaff())
            );
          },
        ),
      const SizedBox(width: 10),
    ],
  );
}