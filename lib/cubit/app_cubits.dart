import 'package:bloc/bloc.dart';
import '../Model/data_model.dart';
import './app_cubit_states.dart';
import '../Services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places: places));
    } catch (e) {
      print(e);
    }
  }

  void getToDetailPage(DataModel data) {
    emit(DetailState(place: data));
  }


  void getBackToHomePage() {
    emit(LoadedState(places: places));
  }
}
