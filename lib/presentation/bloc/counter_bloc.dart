import 'package:counter/domain/models/api_model.dart';
import 'package:counter/domain/repositories/api_repositories.dart';
import 'package:counter/main.dart';
import 'package:counter/presentation/bloc/counter_state.dart';
import 'package:counter/services/local_storage_service.dart';

import 'counter_event.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int counter, String binary)
      : super(CounterState(counter: LocalStorageService().getCounter(), binary: "Loading")) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
    on<Reset>(_onReset);
    on<OnStart>(_onOnStart);
  }

  Future<void> _onIncrement(Increment event, Emitter<CounterState> emit) async {
    try {
      emit(CounterState(counter: state.counter , binary: 'Loading...'));
      Binary bi = (await BinaryRepositories().fetchTheBinary(state.counter+1));
      print(bi.converted);

      emit(CounterState(counter: state.counter+1 , binary: state.binary));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onDecrement(Decrement event, Emitter<CounterState> emit) async {
    try {
      emit(CounterState(counter: state.counter, binary: 'Loading...'));
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

  Future<void> _onOnStart(OnStart event , Emitter<CounterState> emit) async{
    try {
      Binary bi =
      (await BinaryRepositories().fetchTheBinary(state.counter));
      emit(CounterState(counter: state.counter , binary: bi.converted));
    } catch (e) {
      print(e);
    }
  }
}
