import 'package:flutter/cupertino.dart';
import 'package:real_estate_app/model/property_model.dart';

class HomeDataList {
  List<PropertyListModel> propertyListModel;

  HomeDataList({@required this.propertyListModel});

  factory HomeDataList.fromJson(Map<String, dynamic> result) {
    final data = result["data"] as List;
    List<PropertyListModel> propertyList = [];
    data.map((e) => propertyList.add(PropertyListModel.formMap(e))).toList();

    return HomeDataList(propertyListModel: propertyList);
  }
}
