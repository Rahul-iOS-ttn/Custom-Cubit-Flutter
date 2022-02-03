import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../Pages/welcome_page.dart';
import './app_cubit_states.dart';
import './app_cubits.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({ Key? key }) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}