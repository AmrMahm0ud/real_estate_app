import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/bloc/home_bloc/home_event.dart';
import 'package:real_estate_app/bloc/home_bloc/home_repo.dart';
import 'package:real_estate_app/bloc/home_bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BaseHomeRepository baseHomeRepository;

  HomeBloc(this.baseHomeRepository) : super(InitialHomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetHomeDataEvent) {
      if (event.lastRowItem == 1) {
        yield HomeLoadingState();
        yield await baseHomeRepository.getHomeData(event.lastRowItem);
      } else
        yield await baseHomeRepository.getHomeData(event.lastRowItem);
    }
  }
}
