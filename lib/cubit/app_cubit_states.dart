import 'package:equatable/equatable.dart';
import '../Model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  final List<DataModel> places;

  LoadedState({required this.places});

  @override
  List<Object> get props => [places];
}

class DetailState extends CubitStates {
  final DataModel place;

  DetailState({required this.place});

  @override
  List<Object> get props => [place];
}
