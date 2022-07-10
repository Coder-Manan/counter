import 'package:counter/domain/repositories/api_repositories.dart';
import 'package:counter/presentation/bloc/counter_state.dart';
import 'counter_event.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int counter, String binary)
      : super(CounterState(counter:counter, binary: "Loading")) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
    on<Reset>(_onReset);
    on<OnStart>(_onOnStart);
  }

  Future<void> _onIncrement(Increment event, Emitter<CounterState> emit) async {
    try {
      emit(CounterState(counter: state.counter+1, binary: 'Loading'));
      String bi = (await BinaryRepositories().fetchTheBinary(state.counter));

      emit(CounterState(counter: state.counter , binary: bi));
    } catch (e) {
      emit(CounterState(counter: state.counter , binary: "Error$e"));
    }
  }

  Future<void> _onDecrement(Decrement event, Emitter<CounterState> emit) async {
    try {
      emit(CounterState(counter: state.counter - 1, binary: 'Loading'));
      String bi =
          (await BinaryRepositories().fetchTheBinary(state.counter ));
      emit(CounterState(counter: state.counter, binary: bi));
    } catch (e) {
      emit(CounterState(counter: state.counter , binary: "Error$e"));
    }
  }

  Future<void> _onReset(Reset event, Emitter<CounterState> emit) async {
    try {
      emit(const CounterState(counter: 0, binary: "0"));
    } catch (e) {
      emit(CounterState(counter: state.counter , binary: "Error:$e"));
    }
  }

  Future<void> _onOnStart(OnStart event , Emitter<CounterState> emit) async{
    try {
      emit(CounterState(counter: state.counter, binary: "Loading"));
      String bi =
      (await BinaryRepositories().fetchTheBinary(state.counter));
      emit(CounterState(counter: state.counter , binary: bi));
    } catch (e) {
      emit(CounterState(counter: state.counter , binary: "Error$e"));
    }
  }
}
