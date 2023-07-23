import 'package:flutter/material.dart';
import 'package:mon_minuteur_bloc/ui/background_animated.dart';
import 'package:mon_minuteur_bloc/ui/buttons.dart';
import 'package:mon_minuteur_bloc/ui/stack_text_and_indicator.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mon Minuteur")),
      body: const Stack(
        children: [
          //background
          BackgroundAnimated(),
          //Colonne avec une Stack qui contient circular et texte et une row de bouton
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: StackTextAndIndicator(),
              ),
              Buttons()
            ],
          )
        ]
      )
    );
  }


}