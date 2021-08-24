import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderImagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CarouselSlider(
        items: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: [
                  Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/flutter-chat-ec1f2.appspot.com/o/blankphoto.jpg?alt=media&token=174ed9ac-6577-499c-bc09-c58929edf3f3",
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      right: 0.0,
                      child: Container(
                        color: Colors.black45,
                        height: 60.0,
                      )),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              children: [
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/flutter-chat-ec1f2.appspot.com/o/newspapers.jpg?alt=media&token=bbedaad7-423d-4530-8b84-e050b88e386d",
                  fit: BoxFit.fill,
                ),
                Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    right: 0.0,
                    child: Container(
                      color: Colors.white38,
                      height: 60.0,
                    )),
              ],
            ),
          ),
        ],
        options: CarouselOptions(
            initialPage: 0, height: 180, viewportFraction: 0.90),
      ),
    );
  }
}
