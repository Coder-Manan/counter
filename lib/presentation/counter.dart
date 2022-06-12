import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_bloc.dart';
import 'package:counter/services/local_storage_service.dart';
import 'package:counter/core/locator.dart';
int counter = 0;

class Counter extends StatelessWidget {
  const Counter({Key? key, required this.localStorageService}) : super(key: key);

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
      child: (BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Column(
            children: [
              Text(state.toString()),
              FloatingActionButton.extended(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context)
                      .add(Increment(counter: state));
                  localStorageService.setCounter(state+1);
                },
                label: const Text('+'),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context)
                      .add(Decrement(counter: state));
                  localStorageService.setCounter(state-1);
                },
                label: const Text('-'),
              )
            ],
          );
        },
      )),
    );
  }
}
