import 'dart:io';

import 'package:flutter/material.dart';
import 'package:real_estate_app/api_manager/property_api.dart';
import 'package:real_estate_app/bloc/home_bloc/home_state.dart';
import 'package:real_estate_app/model/property_model.dart';
import 'package:real_estate_app/model/slider_model.dart';

abstract class BaseHomeRepository {
  Future<HomeState> getHomeData();
}

class HomeRepository extends BaseHomeRepository {
  @override
  Future<HomeState> getHomeData() async {
    HomeState homeState;
    List<PropertyListModel> propertyList = [];
    List<SliderModel> sliderList = [];
    try {
      propertyList = await getPropertyData();
      sliderList = await getSliderData();
      if (propertyList.length != 0 && sliderList.length != 0) {
        homeState = ReceivedHomeDataState(propertyList);
      } else {
        homeState = ErrorHomeState();
      }
    } on SocketException {
      homeState = NetworkErrorHomeState();
    } catch (error) {
      homeState = ErrorHomeState();
    }
    return homeState;
  }

  Future<List<SliderModel>> getSliderData() async {
    List<SliderModel> sliderList = [];
    try {
      sliderList = await PropertyApi().sliderDataApi();
    } catch (error) {
      throw (error);
    }

    return sliderList;
  }

  Future<List<PropertyListModel>> getPropertyData() async {
    List<PropertyListModel> propertyList = [];
    try {
      propertyList = await PropertyApi().getPropertyListApi();
    } catch (error) {
      throw (error);
    }
    return propertyList;
  }
}
