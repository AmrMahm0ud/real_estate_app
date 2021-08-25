import 'package:dio/dio.dart';
import 'package:real_estate_app/model/property_model.dart';
import 'package:real_estate_app/model/slider_model.dart';
import 'package:real_estate_app/network/remote/end_pionts.dart';
import 'package:real_estate_app/network/remote/home_api.dart';

class PropertyApi {
  Future<List<PropertyModel>> getPropertyListApi() async {
    List<PropertyModel> propertyListModel = [];
    try {
      Response response = await HomeApi.getHomeData(path: PROPERTY, data: {
        "appLanguage": "en",
        "deviceSerial": "EE1F55CE-18DA-4707-983D-E5B8AFCE1825",
        "MeasureUnitId": 2,
        "appversion": "",
        "notificationToken":
            "emfsLB2jaEXwhxtS-w1t3z:APA91bEenrpoS6J8VKrAtxrdpxQZFXong7ftVpuyEntgWmt84QCRQVdPp1ANV75fTBTE8o3-AqR0Zb7LrLAqb5znNrsDsbJ4yTqr6YGbTjEc7444Ruz0cmmnnq13ugeISPL2xHPfHMac",
        "deviceType": 1,
        "userId": 0,
        "data": {
          "PropertyFurnishingId": -1,
          "MinBathRoom": -1,
          "isRented": -1,
          "keyword": "",
          "MinPrice": -1,
          "MinArea": -1,
          "PropId": -1,
          "AreaId": -1,
          "CountryId": 65946,
          "CategoryName": "",
          "CityName": "",
          "PropertyAmenities": [],
          "LastRowId": 19,
          "CityId": -1,
          "propertyAdOnsDtos": [],
          "IsRentedName": "",
          "PropertyTypeName": "",
          "MaxArea": -1,
          "IsFeature": false,
          "MaxBathRoom": -1,
          "MinBedRoom": -1,
          "MaxPrice": -1,
          "CategoryId": -1,
          "FurnishedName": "",
          "PropertyTypeId": 1,
          "SortTypeId": -1,
          "MaxBedRoom": -1,
          "PropertyCity": []
        },
        "ip": "",
        "CurrencyId": 3,
        "CountryId": 65946,
        "osversion": ""
      });
      if (response.statusCode == 200) {
        final extractedData = response.data['data'] as List<dynamic>;
        extractedData.forEach((element) {
          propertyListModel.add(PropertyModel.formJson(element));
        });
      }
    } catch (error) {
      throw (error);
    }
    return propertyListModel;
  }

  Future<List<SliderModel>> sliderDataApi() async {
    List<SliderModel> sliderList = [];
    try {
      Response response = await HomeApi.getHomeData(path: SLIDER, data: {
        "appLanguage": "en",
        "deviceSerial": "EE1F55CE-18DA-4707-983D-E5B8AFCE1825",
        "MeasureUnitId": 2,
        "appversion": "",
        "notificationToken":
            "emfsLB2jaEXwhxtS-w1t3z:APA91bEenrpoS6J8VKrAtxrdpxQZFXong7ftVpuyEntgWmt84QCRQVdPp1ANV75fTBTE8o3-AqR0Zb7LrLAqb5znNrsDsbJ4yTqr6YGbTjEc7444Ruz0cmmnnq13ugeISPL2xHPfHMac",
        "deviceType": 1,
        "userId": 0,
        "data": {},
        "ip": "",
        "CurrencyId": 0,
        "CountryId": 65946,
        "osversion": ""
      });
      if (response.statusCode == 200) {
        final extractedData = response.data['data'] as List<dynamic>;
        extractedData.forEach((element) {
          sliderList.add(SliderModel.formJson(element));
        });
      }
    } catch (error) {
      throw (error);
    }
    return sliderList;
  }
}
