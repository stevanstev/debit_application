import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Advertisement extends StatelessWidget {
  final List<Widget> items;

  Advertisement({this.items});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items.map((i) {
          return Container(
            child: i,
          );
        }).toList(),
        options: CarouselOptions(
            disableCenter: true,
            pageSnapping: true,
            viewportFraction: 0.8,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: Duration(seconds: 3)));
  }
}
