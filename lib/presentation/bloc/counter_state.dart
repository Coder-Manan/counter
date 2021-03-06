import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  const CounterState({required this.counter});
  final int counter;

  @override
  List<Object> get props => [counter];
}