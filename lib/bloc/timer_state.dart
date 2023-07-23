import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int duration;
  const TimerState({required this.duration});

  @override
  List<Object?> get props => [duration];
}

//Start
class StartState extends TimerState {
  const StartState({required super.duration});
}

//Pause
class PauseState extends TimerState {
  const PauseState({required super.duration});
}

//Running
class RunningState extends TimerState {
  const RunningState({required super.duration});
}

//Complete
class CompleteState extends TimerState {
  const CompleteState(): super(duration: 0);
}