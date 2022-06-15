import 'package:counter/domain/models/api_model.dart';
import 'package:counter/domain/repositories/api_repositories.dart';
import 'package:counter/presentation/bloc/counter_state.dart';
import 'package:counter/presentation/counter.dart';
import 'package:counter/services/api_services.dart';
import 'package:flutter/foundation.dart';

import 'counter_event.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int counter, String binary)
      : super(CounterState(counter: counter, binary: "Loading")) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
    on<Reset>(_onReset);
  }

  Future<void> _onIncrement(Increment event, Emitter<CounterState> emit) async {
    try {
      emit(CounterState(counter: state.counter + 1, binary: 'Loading...'));
      Binary bi =
          (await BinaryRepositories().fetchTheBinary(state.counter + 1));

      print(bi.converted);
      emit(CounterState(counter: state.counter + 1, binary: bi.converted));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onDecrement(Decrement event, Emitter<CounterState> emit) async {
    try {
      emit(CounterState(counter: state.counter - 1, binary: 'Loading...'));
      Binary bi =
          (await BinaryRepositories().fetchTheBinary(state.counter - 1));
      emit(CounterState(counter: state.counter - 1, binary: bi.converted));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onReset(Reset event, Emitter<CounterState> emit) async {
    try {
      emit(const CounterState(counter: 0, binary: "0"));
    } catch (e) {
      print(e);
    }
  }
}

//
// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc(int counter,String binary) : super(CounterState(counter:counter, binary:"loading..." )) {
//     on<Increment>(event, emit)
//
//     }
//     on<Decrement>(event, emit) async {
//     try {
//       emit(CounterState(counter: state.counter - 1, binary: 'loading...'));
//       Binary bi = (await BinaryRepositories().fetchTheBinary(state.counter - 1)) ;
//       emit (CounterState( counter: state.counter-1, binary: bi.converted));
//     }
//     catch(e){print(e);}
//   }
//   }
//
//
//   Future<void> _onIncrement(Increment event ,Emitter<CounterState> emit) async {
//
//     try {
//       emit(CounterState(counter: state.counter + 1, binary: 'loading...'));
//       Binary bi = (await BinaryRepositories().fetchTheBinary(state.counter + 1)) ;
//       emit (CounterState( counter: state.counter+1, binary: bi.converted));
//     }
//     catch(e){print(e);}
//
//   }
// }

//   catch(e){print(e);}
// }
// x = fname(counter) == null ? "loading binary" : x

// on<Increment>((event, emit) async {emit(CounterState(counter: state.counter+1, binary: "loading")); final Binary x = await BinaryRepositories().fetchTheBinary(state.counter+1); emit(CounterState(counter: state.counter, binary:"x"));});
// ((event, emit) => emit(CounterState(counter: state.counter + 1, binary: BinaryRepositories().fetchTheBinary(state.counter + 1).)));
// on<Decrement>((event, emit) => emit(CounterState(counter: state.counter - 1, binary: "loading")));
//on <BinaryLoaded>(((event, emit) => emit(CounterState(counter: state.counter, binaryLoaded: "loading"))));
//on<Reset>((event , emit) => emit(CounterState(counter: 0, binaryLoaded: false)));
