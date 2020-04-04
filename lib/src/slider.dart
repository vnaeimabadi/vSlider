import 'package:flutter/material.dart';

class Slider extends StatelessWidget {
  final width;
  final height;
  final color;

  Slider({this.width,this.height,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      color: this.color,
    );
  }

}
