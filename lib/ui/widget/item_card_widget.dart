import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemCardWidget extends StatefulWidget {
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
  _ItemCardWidgetState createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        elevation: 20.0,
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          children: [
            Container(
              width: 140,
              child: sliderImageCardWidget(widget.sliderCardImages),
            ),
            Expanded(
              child: Container(
                height: 105,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, top: 1.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.category.toUpperCase(),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 4.0, top: 2.0, bottom: 2.0),
                      child: Text(
                        widget.price + " AED",
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 100,
                        child: Text(
                          widget.address,
                          maxLines: 2,
                          style: TextStyle(fontSize: 13.0, color: Colors.black),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 6.0),
                          child: Text(
                            "${removeDecimalZeroFormat(widget.bedRooms)}",
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black54,
                            ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 6.0),
                          child: Text(
                            "${removeDecimalZeroFormat(widget.bathRooms)}",
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black54,
                            ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Text(
                            "${widget.areaSpace}" + " sqft",
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black54,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

///////////////////////////////
////////////Helper Widget ///////
/////////////////////////////////

  Widget sliderImageCardWidget(List<String> imagesUrl) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: imagesUrl
              .map(
                (image) => Container(
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
                ),
              )
              .toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            viewportFraction: 1.0,
            height: 115,
          ),
        ),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.sliderCardImages.length,
        effect: SlideEffect(
          dotColor: Colors.grey,
          dotHeight: 6,
          dotWidth: 6,
          spacing: 1.5,
          paintStyle: PaintingStyle.fill,
          strokeWidth: 1,
          activeDotColor: Colors.white,
        ),
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
