import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_minuteur_bloc/bloc/timer_event.dart';
import 'package:mon_minuteur_bloc/bloc/timer_state.dart';
import 'package:mon_minuteur_bloc/model/seconds_ticker.dart';
import 'dart:async';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const duration = 60;
  final SecondsTicker secondsTicker;
  StreamSubscription<int>? _streamSubscription;

  TimerBloc({required this.secondsTicker}): super(const StartState(duration: duration)){
    on<StartEvent>(onStart);
    on<PauseEvent>(onPause);
    on<ResumeEvent>(onResume);
    on<ResetEvent>(onReset);
    on<TickEvent>(onTick);
  }

  onStart(StartEvent event, Emitter<TimerState> emit){
    emit(RunningState(duration: event.duration));
    _streamSubscription?.cancel();
    _streamSubscription = secondsTicker
        .tick(ticks: event.duration)
        .listen((event) => add(TickEvent(duration: event)));
  }

  onPause(PauseEvent event, Emitter<TimerState> emit){
    if (state is RunningState) _streamSubscription?.pause();
    emit(PauseState(duration: state.duration));
  }

  onResume(ResumeEvent event, Emitter<TimerState> emit){
    if (state is PauseState) _streamSubscription?.resume();
    emit(RunningState(duration: state.duration));
  }

  onReset(ResetEvent event, Emitter<TimerState> emit){
    _streamSubscription?.cancel();
    emit( const StartState(duration: duration));
  }

  onTick(TickEvent event, Emitter<TimerState> emit){
    event.duration > 0
        ? emit(RunningState(duration: event.duration))
        : emit( const CompleteState());
  }
}