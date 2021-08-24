import 'dart:io';

import 'package:dio/dio.dart';
import 'package:real_estate_app/api_manager/property_api.dart';
import 'package:real_estate_app/bloc/home_bloc/home_state.dart';
import 'package:real_estate_app/model/property_model.dart';
import 'package:real_estate_app/network/remote/end_pionts.dart';
import 'package:real_estate_app/network/remote/home_api.dart';

abstract class BaseHomeRepository {
  Future<HomeState> getHomeData();
}

class HomeRepository extends BaseHomeRepository {
  @override
  Future<HomeState> getHomeData() async {
    HomeState homeState;
    List<PropertyListModel> propertyList = [];
    try {
      propertyList = await PropertyApi.getPropertyListApi();
      print(propertyList.length);
    } on SocketException {
      homeState = NetworkErrorHomeState();
    } catch (error) {
      homeState = ErrorHomeState();
    }
    return homeState;
  }
}
