import 'package:flutter/material.dart';

class ProgresStepper extends StatelessWidget{
  final int totalSteps;
  final int currentStep; // 0, 1, 2

  const ProgresStepper({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  });

 @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalSteps, (index) {
        final bool isSelected = index == currentStep;
        
        return Container(
          // La barretta selezionata è larga 30, il pallino 10
          width: isSelected ? 40 : 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            // Blu se selezionato, Grigio chiaro se no
            color: isSelected 
                ? Color.fromARGB(255, 23, 93, 142)
                : Colors.grey[400],
            // Arrotondamento massimo (Circle) per i pallini, 
            // arrotondamento parziale per la barretta
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}