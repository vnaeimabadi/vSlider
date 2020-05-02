import 'package:flutter/material.dart';

class Slider extends StatefulWidget {
  final width;
  final height;
  final color;
  final List<Widget> items;

  Slider({
    this.width = double.infinity,
    this.height = 300.0,
    this.color = Colors.red,
    this.items,
  });

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10,),
      height: this.widget.height,
      width: this.widget.width,
      color: this.widget.color,
      child: widget.items == null
          ? Container()
          : PageView.builder(
        // store this controller in a State to save the carousel scroll position
        controller: PageController(viewportFraction: 0.85),
        onPageChanged: (int index) => setState(() => _index = index),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _buildCarouselItem(context, 0, itemIndex);
        },
        itemCount: widget.items.length,
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      child: Transform.scale(
        scale: itemIndex == _index ? 1 : 0.95,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              "Card ${itemIndex + 1}",
              style: TextStyle(fontSize: 33),
            ),
          ),
        ),
      ),
//      child: widget.items[itemIndex],
    );
  }
}
