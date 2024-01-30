import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'swither_event.dart';
part 'swither_state.dart';

class SwitherBloc extends Bloc<SwitherEvent, SwitherState> {
  SwitherBloc() : super(SwitherState()) {
    on<EnableOrDisableNotification>((event, emit) {
      emit(state.copyWith(isSwitch: !state.isSwitch));
    });
    on<SwitherChangedEvent>((event, emit) {
      emit(state.copyWith(sliderValue: event.slider));
    });
  }
}
