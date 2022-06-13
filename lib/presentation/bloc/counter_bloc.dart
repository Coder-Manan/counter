import 'package:counter/presentation/bloc/counter_state.dart';

import 'counter_event.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int counter) : super(CounterState(counter: counter)) {
    on<Increment>((event, emit) => emit(CounterState(counter: state.counter + 1)));
    on<Decrement>((event, emit) => emit(CounterState(counter: state.counter - 1)));
  }
}