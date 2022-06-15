import 'package:counter/domain/repositories/api_repositories.dart';
import 'package:counter/presentation/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'bloc/counter_event.dart';
import 'bloc/counter_bloc.dart';
import 'package:counter/services/local_storage_service.dart';
import 'package:counter/core/locator.dart';


int counter = 0;
String binary ="loading..." ;

class Counter extends StatelessWidget {
  const Counter({Key? key, required this.localStorageService})
      : super(key: key);

  initState() async {
    await setupLocator();
    LocalStorageService localStorageService = locator<LocalStorageService>();
    counter = localStorageService.getCounter();
  }

  //function

  final LocalStorageService localStorageService;
  @override
  Widget build(BuildContext context) {
    counter = localStorageService.getCounter();
    return BlocProvider(
    create: (_) => CounterBloc(counter,binary),
      child: (BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          BlocProvider.of<CounterBloc>(context)
                      .add(OnStart(counter: state.counter)); // add start event
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Counter : ${state.counter}"),
                  Text("Binary : ${state.binary}"),
                  FloatingActionButton.extended(
                    onPressed: ()  {
                       BlocProvider.of<CounterBloc>(context)
                          .add(Increment(counter: state.counter));
                      localStorageService.setCounter(state.counter+1);
                    },
                    label: const Text('+'),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(Decrement(counter: state.counter));
                      localStorageService.setCounter(state.counter-1);
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
