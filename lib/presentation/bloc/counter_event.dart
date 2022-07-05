import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class Error extends CounterEvent {
  const Error({required this.counter});
  final int counter;

  @override
  List<Object> get props => [counter];
}

class Increment extends CounterEvent {
  const Increment({required this.counter});
  final int counter;

  @override
  List<Object> get props => [counter];
}

class Decrement extends CounterEvent {
  const Decrement({required this.counter});
  final int counter;
  @override
  List<Object> get props => [counter];
}


class Reset extends CounterEvent {
  final int counter;
  const Reset({required this.counter});
  @override
  List<Object> get props => [counter];
}


class OnStart extends CounterEvent{
  final int counter;
  const OnStart({required this.counter});
  @override
  List<Object> get props => [counter];
}