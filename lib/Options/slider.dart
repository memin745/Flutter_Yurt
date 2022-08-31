

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class slider extends StatelessWidget {
  const slider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Carousel(
      dotSize: 6.0,
      dotSpacing: 15.0,
      dotPosition: DotPosition.bottomCenter,
      images: [
        Image.network('https://picsum.photos/200/300',
            fit: BoxFit.cover),
        Image.network('https://picsum.photos/200/300',
            fit: BoxFit.cover),
        Image.network('https://picsum.photos/200/300',
            fit: BoxFit.cover),
        Image.network('https://picsum.photos/200/300',
            fit: BoxFit.cover),
        Image.network('https://picsum.photos/200/300',
            fit: BoxFit.cover),
        Image.network('https://picsum.photos/200/300',
            fit: BoxFit.cover),
      ],
    );
  }
}