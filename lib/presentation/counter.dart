import 'package:counter/presentation/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_bloc.dart';
import 'package:counter/services/local_storage_service.dart';
import 'package:counter/core/locator.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final LocalStorageService localStorageService =
        locator<LocalStorageService>();
    int counter = localStorageService.getCounter();
    CounterBloc bloc = CounterBloc(counter.isNaN ? 0 : counter, "Loading");
    bloc.add(OnStart(counter: counter));
    return BlocProvider(
      create: (_) => bloc,
      child: (BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {

          if (state.binary.startsWith("Error")) {
            return Column(children: [
              Text(state.binary),
              FloatingActionButton.extended(
                  onPressed: (() => bloc.add(OnStart(counter: state.counter))),
                  label: const Text("Retry"),)
            ]);
          }
          if (state.binary.startsWith("Loading")) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [CircularProgressIndicator()],
                ),
              ],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Counter : ${state.counter}"),
                  Text("Binary : ${state.binary}"),
                  FloatingActionButton.extended(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(Increment(counter: state.counter));
                      localStorageService.setCounter(state.counter + 1);
                    },
                    label: const Text('+'),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      if (state.counter > 0) {
                        BlocProvider.of<CounterBloc>(context)
                            .add(Decrement(counter: state.counter));
                        localStorageService.setCounter(state.counter - 1);
                      }
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
              ),
            ],
          );
        },
      )),
    );
  }
}
