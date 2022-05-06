part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class SwitchDarkMode extends ThemeEvent {
  final bool? isOn;
  const SwitchDarkMode(this.isOn);
}
