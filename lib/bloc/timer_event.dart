import 'dart:async';

abstract class TimerEvent {
  const TimerEvent();
}

//Start
class StartEvent extends TimerEvent {
  final int duration;
  const StartEvent({required this.duration});
}

//Pause
class PauseEvent extends TimerEvent {}

//Resume
class ResumeEvent extends TimerEvent {}

//Reset
class ResetEvent extends TimerEvent {}

//Tick
class TickEvent extends TimerEvent {
  final int duration;
  const TickEvent({required this.duration});
}