part of 'swither_bloc.dart';

class SwitherState extends Equatable {
  bool isSwitch;
  double sliderValue;

  SwitherState({this.isSwitch = false, this.sliderValue = 0.0});

  SwitherState copyWith({
    bool? isSwitch,
    double? sliderValue,
  }) {
    return SwitherState(
      isSwitch: isSwitch ?? this.isSwitch,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object?> get props => [isSwitch, sliderValue];
}
