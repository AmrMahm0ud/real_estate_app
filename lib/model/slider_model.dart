class SliderModel {
  String price;
  String address;
  String category;
  double bedRooms;
  double bathRooms;
  double areaSpace;
  String sliderImage;

  SliderModel(
      {this.price,
      this.address,
      this.category,
      this.bedRooms,
      this.bathRooms,
      this.areaSpace,
      this.sliderImage});

  SliderModel.formJson(Map<String, dynamic> sliderFromJson) {
    price = sliderFromJson['price'] as String;
    address = sliderFromJson['address'] as String;
    category = sliderFromJson['category'] as String;
    bedRooms = sliderFromJson['bedRoom'] as double;
    bathRooms = sliderFromJson['bathRoom'] as double;
    areaSpace = sliderFromJson['areaSpace'] as double;
    sliderImage = sliderFromJson['propertyImages'][0]['url'] as String;
  }
}
