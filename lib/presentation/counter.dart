import 'package:counter/domain/repositories/api_repositories.dart';
import 'package:counter/presentation/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_bloc.dart';
import 'package:counter/services/local_storage_service.dart';
import 'package:counter/core/locator.dart';


int counter = 0;
String binary ="" ;

class Counter extends StatelessWidget {
  const Counter({Key? key, required this.localStorageService})
      : super(key: key);

  initState() async {
    await setupLocator();
    LocalStorageService localStorageService = locator<LocalStorageService>();
    counter = localStorageService.getCounter();
  }

  final LocalStorageService localStorageService;
  @override
  Widget build(BuildContext context) {
    counter = localStorageService.getCounter();
    return BlocProvider(
    create: (_) => CounterBloc(counter),
      child: (BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(state.counter.toString()),
              Text("Binary Text"),
              FloatingActionButton.extended(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context)
                      .add(Increment(counter: state.counter));
                  localStorageService.setCounter(state.counter);
                },
                label: const Text('+'),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context)
                      .add(Decrement(counter: state.counter));
                  localStorageService.setCounter(state.counter);
                },
                label: const Text('-'),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context)
                      .add(Reset(counter: state.counter));
                  localStorageService.setCounter(0);
                },
                label: const Text('@'),
              ),
            ],
          );
        },
      )),
    );
  }
}
