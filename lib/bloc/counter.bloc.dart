import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

abstract class CounterState {
  int counter;
  CounterState({required this.counter});
}

class CounterStateSecces extends CounterState {
  CounterStateSecces({required super.counter});
}

class CounterStateError extends CounterState {
  String ErrMessage;
  CounterStateError({required super.counter, required this.ErrMessage});
}

class IntialCounterState extends CounterState {
  IntialCounterState() : super(counter: 0);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(IntialCounterState()) {
    on((CounterIncrementEvent, emit) {
      if (state.counter < 10) {
        emit(CounterStateSecces(counter: state.counter + 1));
      } else {
        emit(CounterStateError(
            counter: state.counter,
            ErrMessage: "The counter value can not exceed 10"));
      }
    });
    on((CounterDecrementEvent event, emit) {
      if (state.counter > 0) {
        emit(CounterStateSecces(counter: state.counter - 1));
      } else {
        emit(CounterStateError(
            counter: state.counter,
            ErrMessage: "The counter value can not be less then 0"));
      }
    });
  }
}
