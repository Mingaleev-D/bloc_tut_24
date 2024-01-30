import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });
    on<DecrementCounter>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }
}
