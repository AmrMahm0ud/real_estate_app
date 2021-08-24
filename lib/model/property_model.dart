class PropertyListModel {
  String price;
  String address;
  String category;
  String bedRooms;
  String bathRooms;
  String areaSpace;

  PropertyListModel(this.price, this.address, this.category, this.bedRooms,
      this.bathRooms, this.areaSpace);

  PropertyListModel.formMap(Map<String, dynamic> propertyFromMap) {
    this.price = propertyFromMap['price'] as String;
    this.address = propertyFromMap['address'] as String;
    this.category = propertyFromMap['category'] as String;
    this.bedRooms = propertyFromMap['bedRoom'] as String;
    this.bathRooms = propertyFromMap['bathRoom'] as String;
    this.areaSpace = propertyFromMap['areaSpace'] as String;
  }
}
