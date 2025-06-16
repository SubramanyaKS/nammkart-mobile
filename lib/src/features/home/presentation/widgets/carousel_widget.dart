import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nammkart/src/features/home/presentation/widgets/widget_item.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Other widgets
            CarouselSlider(
              items: carouselItems,
              options: CarouselOptions(
                height: size.height*0.2, // Customize the height of the carousel
                autoPlay: true, // Enable auto-play
                enlargeCenterPage: true, // Increase the size of the center item
                enableInfiniteScroll: true, // Enable infinite scroll
                onPageChanged: (index, reason) {
                  // Optional callback when the page changes
                  // You can use it to update any additional UI components
                },
              ),
            ),
            // Other widgets
          ],
        );
  }
}
