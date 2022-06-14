import 'package:counter/domain/models/api_model.dart';
import 'package:counter/domain/repositories/api_repositories.dart';
import 'package:counter/presentation/bloc/counter_state.dart';
import 'package:counter/presentation/counter.dart';
import 'package:flutter/foundation.dart';

import 'counter_event.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int counter) : super(CounterState(counter:counter )) {
    // on<Increment>(event, emit) async{
    //   try {
    //     emit(BinaryLoading(counter: state.counter + 1, binary: ''));
    //     bi = (await BinaryRepositories().fetchTheBinary(state.counter + 1)) as String;
    //     emit (BinaryLoaded( counter: state.counter+1, binary: bi));
    //   }
    //   catch(e){print(e);}
    // }

    on<Increment>((event, emit)=> emit(CounterState(counter: state.counter+1)));
      // ((event, emit) => emit(CounterState(counter: state.counter + 1, binary: BinaryRepositories().fetchTheBinary(state.counter + 1).)));
    on<Decrement>((event, emit) => emit(CounterState(counter: state.counter - 1)));
    on<Reset>((event , emit) => emit(CounterState(counter: 0)));
  }

  // Future<void> _onIncrement(event ,  emit) async{
  //   try {
  //     emit(BinaryLoading(counter: state.counter + 1));
  //   bi = (await BinaryRepositories().fetchTheBinary(state.counter + 1)) as String;
  //   emit (BinaryLoaded(bi, counter: state.counter));
  //   }
  //   catch(e){print(e);}
  // }
}
