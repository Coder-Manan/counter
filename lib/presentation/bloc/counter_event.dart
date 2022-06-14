import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
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

class NumChange extends CounterEvent {
  final int binary;
  const NumChange({required this.binary});
  @override
  List<Object> get props => [binary];
}
