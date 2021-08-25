class PropertyListModel {
  String price;
  String address;
  String category;
  double bedRooms;
  double bathRooms;
  double areaSpace;
  List<String> propertyImages = [];

  PropertyListModel(
      {this.price,
      this.address,
      this.category,
      this.bedRooms,
      this.bathRooms,
      this.areaSpace,
      this.propertyImages});

  PropertyListModel.formJson(Map<String, dynamic> propertyFromMap) {
    price = propertyFromMap['price'] as String;
    address = propertyFromMap['address'] as String;
    category = propertyFromMap['category'] as String;
    bedRooms = propertyFromMap['bedRoom'] as double;
    bathRooms = propertyFromMap['bathRoom'] as double;
    areaSpace = propertyFromMap['areaSpace'] as double;
    List<dynamic> images = propertyFromMap['propertyImages'].toList();
    images.forEach((element) {
      propertyImages.add((element['url']) as String);
    });
  }
}
