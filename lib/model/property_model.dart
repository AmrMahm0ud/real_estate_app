class PropertyListModel {
  final String price;
  final String address;
  final String category;
  final double bedRooms;
  final double bathRooms;
  final double areaSpace;

  PropertyListModel(
      {this.price,
      this.address,
      this.category,
      this.bedRooms,
      this.bathRooms,
      this.areaSpace});

  factory PropertyListModel.formJson(Map<String, dynamic> propertyFromMap) {
    return PropertyListModel(
      price: propertyFromMap['price'] as String,
      address: propertyFromMap['address'] as String,
      category: propertyFromMap['category'] as String,
      bedRooms: propertyFromMap['bedRoom'] as double,
      bathRooms: propertyFromMap['bathRoom'] as double,
      areaSpace: propertyFromMap['areaSpace'] as double,
    );
  }
}
