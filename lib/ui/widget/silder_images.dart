import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:real_estate_app/model/slider_model.dart';

class SliderImagesWidget extends StatelessWidget {
  final List<SliderModel> sliderList;

  SliderImagesWidget(this.sliderList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CarouselSlider(
        items: sliderList.map((item) => imageWidget(context, item)).toList(),
        options: CarouselOptions(
          initialPage: 0,
          height: 180,
          viewportFraction: 0.90,
          reverse: true,
        ),
      ),
    );
  }

//////////////////////////////////
//////////helper Widget///////////
/////////////////////////////////
  Widget imageWidget(BuildContext context, SliderModel sliderModel) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 20.0,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(sliderModel.sliderImage))),
            ),
            Positioned(
                left: 0.0,
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.transparent])),
                  height: 60.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                sliderModel.category.toUpperCase(),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Text(
                              sliderModel.price + " AED",
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ],
                        ),
                        Text(
                          sliderModel.address,
                          style: TextStyle(fontSize: 13),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Icon(Icons.king_bed_outlined),
                            ),
                            Text(
                              "${removeDecimalZeroFormat(sliderModel.bedRooms)}",
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Icon(Icons.bathtub_outlined),
                            ),
                            Text(
                              "${removeDecimalZeroFormat(sliderModel.bathRooms)}",
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Icon(Icons.apartment),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "${sliderModel.areaSpace}" + " sqft",
                                style: TextStyle(fontSize: 11.0),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  /////////////////////////////////
////////////helper function//////////
/////////////////////////////////////
  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }
}
