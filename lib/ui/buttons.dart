import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_minuteur_bloc/bloc/timer_event.dart';
import 'package:mon_minuteur_bloc/bloc/timer_state.dart';

import '../bloc/timer_bloc.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children(context, state)
          );
        }
    );
  }

  List<Widget> children(BuildContext context, TimerState state) {
    FloatingActionButton playBtn = FloatingActionButton(
        onPressed: () => play(context, state),
      child: const Icon(Icons.play_arrow),
    );
    FloatingActionButton pauseBtn = FloatingActionButton(
      onPressed: () => pause(context, state),
      child: const Icon(Icons.pause),
    );
    FloatingActionButton resumeBtn = FloatingActionButton(
      onPressed: () => resume(context, state),
      child: const Icon(Icons.play_arrow),
    );
    FloatingActionButton resetBtn = FloatingActionButton(
      onPressed: () => play(context, state),
      child: const Icon(Icons.replay),
    );

    if (state is StartState) return [playBtn];
    if (state is RunningState) return [pauseBtn, resetBtn];
    if (state is PauseState) return [resumeBtn, resetBtn];
    if (state is CompleteState) return [resetBtn];
    return[];
  }

  play(BuildContext context, TimerState state) => context.read<TimerBloc>().add(StartEvent(duration: state.duration));

  pause(BuildContext context, TimerState state) => context.read<TimerBloc>().add(PauseEvent());

  resume(BuildContext context, TimerState state) => context.read<TimerBloc>().add(ResumeEvent());

  reset(BuildContext context, TimerState state) => context.read<TimerBloc>().add(ResetEvent());
}