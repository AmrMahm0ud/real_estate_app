import 'package:real_estate_app/model/property_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class ReceivedHomeDataState extends HomeState {
  final List<PropertyListModel> propertyListModel;

  ReceivedHomeDataState(this.propertyListModel);
}

class HomeLoadingState extends HomeState {}

class NetworkErrorHomeState extends HomeState {}

class ErrorHomeState extends HomeState {}
