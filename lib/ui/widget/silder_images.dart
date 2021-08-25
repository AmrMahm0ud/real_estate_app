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
            initialPage: 0, height: 180, viewportFraction: 0.90),
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
                    color: Colors.black45,
                  ),
                  height: 60.0,
                )),
          ],
        ),
      ),
    );
  }
}
