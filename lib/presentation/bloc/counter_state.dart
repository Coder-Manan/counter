import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  const CounterState({required this.counter, required this.binary});
  final int counter;
  final String binary;

  @override
  List<Object> get props => [counter, binary];
}
