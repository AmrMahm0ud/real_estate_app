import 'dart:io';

import 'package:real_estate_app/api_manager/home_api_manager.dart';
import 'package:real_estate_app/bloc/home_bloc/home_state.dart';
import 'package:real_estate_app/model/property_model.dart';
import 'package:real_estate_app/model/slider_model.dart';

abstract class BaseHomeRepository {
  Future<HomeState> getHomeData(int lastRowItem);
}

class HomeRepository extends BaseHomeRepository {
  @override
  Future<HomeState> getHomeData(int lastRowItem) async {
    HomeState homeState;
    List<PropertyModel> propertyList = [];
    List<SliderModel> sliderList = [];
    try {
      propertyList = await getPropertyData(lastRowItem);
      sliderList = await getSliderData();
      if (propertyList.length != 0 && sliderList.length != 0) {
        homeState = ReceivedHomeDataState(
            propertyListModel: propertyList, sliderListModel: sliderList);
      } else {
        homeState = ErrorHomeState("Something want wrong!");
      }
    } on SocketException {
      homeState = NetworkErrorHomeState("No internet");
    } catch (error) {
      homeState = ErrorHomeState("Something want wrong!");
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

  Future<List<PropertyModel>> getPropertyData(int lastRowItem) async {
    List<PropertyModel> propertyList = [];
    try {
      propertyList = await HomeApiManager().getPropertyListApi(lastRowItem);
    } catch (error) {
      throw (error);
    }
    return propertyList;
  }
}
