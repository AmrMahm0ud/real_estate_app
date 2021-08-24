import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderImagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: CarouselSlider(
            items: [
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  color: Colors.red,
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/flutter-chat-ec1f2.appspot.com/o/blankphoto.jpg?alt=media&token=174ed9ac-6577-499c-bc09-c58929edf3f3"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  color: Colors.black,
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/flutter-chat-ec1f2.appspot.com/o/newspapers.jpg?alt=media&token=bbedaad7-423d-4530-8b84-e050b88e386d"),
                ),
              )
            ],
            options: CarouselOptions(
                initialPage: 0, height: 150, viewportFraction: 0.75),
          ),
        ),
      ),
    );
  }
}
