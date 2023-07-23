import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_minuteur_bloc/bloc/timer_state.dart';

import '../bloc/timer_bloc.dart';

class BackgroundAnimated extends StatelessWidget {
  const BackgroundAnimated({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.primaryContainer,
      Theme.of(context).colorScheme.primaryContainer
    ];
    return BlocBuilder<TimerBloc, TimerState>(
        buildWhen: (prev, cur) => prev.runtimeType != cur.runtimeType,
        builder: (context, state) {
          final position = context.select((TimerBloc bloc) => bloc.state.duration) / 60;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, position, 1],
                colors: colors
              )
            ),
          );
        }
    );
  }

}