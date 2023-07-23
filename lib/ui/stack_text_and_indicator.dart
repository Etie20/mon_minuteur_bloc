import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_minuteur_bloc/bloc/timer_bloc.dart';

class StackTextAndIndicator extends StatelessWidget{
  const StackTextAndIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: CircularProgressIndicator(
              value: duration/60,
              color: Theme.of(context).colorScheme.primaryContainer,
              strokeWidth: 8,
            )
          ),
          Text(
            duration.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          )
        ],
      ),
    );
  }

}