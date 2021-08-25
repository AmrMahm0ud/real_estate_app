class PropertyModel {
  String price;
  String address;
  String category;
  double bedRooms;
  double bathRooms;
  double areaSpace;
  List<String> propertyImages = [];

  PropertyModel(
      {this.price,
      this.address,
      this.category,
      this.bedRooms,
      this.bathRooms,
      this.areaSpace,
      this.propertyImages});

  PropertyModel.formJson(Map<String, dynamic> propertyFromJson) {
    price = propertyFromJson['price'] as String;
    address = propertyFromJson['address'] as String;
    category = propertyFromJson['category'] as String;
    bedRooms = propertyFromJson['bedRoom'] as double;
    bathRooms = propertyFromJson['bathRoom'] as double;
    areaSpace = propertyFromJson['areaSpace'] as double;
    List<dynamic> images = propertyFromJson['propertyImages'].toList();
    images.forEach((element) {
      propertyImages.add((element['url']) as String);
    });
  }
}
