import 'package:flutter/cupertino.dart';
import 'package:real_estate_app/model/property_model.dart';
import 'package:real_estate_app/model/slider_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class ReceivedHomeDataState extends HomeState {
  final List<PropertyListModel> propertyListModel;
  final List<SliderModel> sliderListModel;

  ReceivedHomeDataState(
      {@required this.propertyListModel, @required this.sliderListModel});
}

class HomeLoadingState extends HomeState {}

class NetworkErrorHomeState extends HomeState {}

class ErrorHomeState extends HomeState {}
