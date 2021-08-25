import 'dart:io';

import 'package:real_estate_app/api_manager/home_api_manager.dart';
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
    List<PropertyModel> propertyList = [];
    List<SliderModel> sliderList = [];
    try {
      propertyList = await getPropertyData();
      sliderList = await getSliderData();
      if (propertyList.length != 0 && sliderList.length != 0) {
        homeState = ReceivedHomeDataState(
            propertyListModel: propertyList, sliderListModel: sliderList);
      } else {
        homeState = ErrorHomeState("Some thing want wrong!");
      }
    } on SocketException {
      homeState = NetworkErrorHomeState("No internet");
    } catch (error) {
      homeState = ErrorHomeState("Some thing want wrong!");
    }
    return homeState;
  }

  Future<List<SliderModel>> getSliderData() async {
    List<SliderModel> sliderList = [];
    try {
      sliderList = await HomeApiManager().sliderDataApi();
    } catch (error) {
      throw (error);
    }

    return sliderList;
  }

  Future<List<PropertyModel>> getPropertyData() async {
    List<PropertyModel> propertyList = [];
    try {
      propertyList = await HomeApiManager().getPropertyListApi();
    } catch (error) {
      throw (error);
    }
    return propertyList;
  }
}
