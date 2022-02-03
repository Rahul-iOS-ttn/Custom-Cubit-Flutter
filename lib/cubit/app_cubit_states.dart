import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CubitStates extends Equatable {}

class InitialStates extends CubitStates {
  @override
  List<Object> get props => [];
  
}



class WelcomeStates extends CubitStates {
  @override
  List<Object> get props => [];
  
}