part of 'swither_bloc.dart';

abstract class SwitherEvent extends Equatable {
  const SwitherEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitherEvent {}

class SwitherChangedEvent extends SwitherEvent {
  double slider;
  SwitherChangedEvent({
    required this.slider,
  });

  @override
  List<Object> get props => [slider];
}
