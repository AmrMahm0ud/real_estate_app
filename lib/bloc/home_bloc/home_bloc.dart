import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/bloc/home_bloc/home_event.dart';
import 'package:real_estate_app/bloc/home_bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {}
}
