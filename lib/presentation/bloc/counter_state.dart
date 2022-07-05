import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  const CounterState({required this.counter, required this.binary});
  final int counter;
  final String binary;

  @override
  List<Object> get props => [counter, binary];
}

// class BinaryLoading extends CounterState {
//   const BinaryLoading({required super.counter, required super.binary});
//
// }
//
// class BinaryLoaded extends CounterState {
//   const BinaryLoaded({required super.counter, required super.binary});
// }