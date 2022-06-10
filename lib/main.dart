import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }
}

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

class CounterState extends Equatable {
  const CounterState({required this.counter});
  final int counter;

  @override
  List<Object> get props => [counter];
}

void main() {
  runApp(const MyApp());
}

int counter = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Bloc Test'),
          ),
          body: BlocProvider(
            create: (_) => CounterBloc(),
            child: (BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(state.toString()),
                    FloatingActionButton.extended(
                      onPressed: () => BlocProvider.of<CounterBloc>(context)
                          .add(Increment(counter: state)),
                      label: const Text('+'),
                    ),
                    FloatingActionButton.extended(
                      onPressed: () => BlocProvider.of<CounterBloc>(context)
                          .add(Decrement(counter: state)),
                      label: const Text('-'),
                    )
                  ],
                );
              },
            )),
          )),
    );
  }
}
