import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final String price, address, category;

  final double bedRooms, bathRooms, areaSpace;

  final List<String> sliderCardImages;

  const ItemCardWidget(
      {Key key,
      this.price,
      this.address,
      this.category,
      this.bedRooms,
      this.bathRooms,
      this.areaSpace,
      this.sliderCardImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        height: 120,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0.0,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                ),
                width: 140,
                child: sliderImageCardWidget(sliderCardImages),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  category.toUpperCase(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            price + " AED",
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            width: 100,
                            child: Text(
                              address,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.black),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Icon(
                                Icons.king_bed_outlined,
                                size: 22,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              "${removeDecimalZeroFormat(bedRooms)}",
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Icon(
                                Icons.bathtub_outlined,
                                size: 22,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              "${removeDecimalZeroFormat(bathRooms)}",
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Icon(
                                Icons.apartment,
                                size: 22,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              "$areaSpace" + " sqft",
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

///////////////////////////////
////////////Helper Widget ///////
/////////////////////////////////

  Widget sliderImageCardWidget(List<String> imagesUrl) {
    return CarouselSlider(
      items: imagesUrl
          .map((image) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      image,
                    ),
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: 115,
      ),
    );
  }

  ///////////////////////////////
/////////////helper function/////
////////////////////////////////

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }
}
