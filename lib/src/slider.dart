import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Slider extends StatefulWidget {
  final width;
  final height;
  final color;
  final List<Widget> items;
  final List<String> imagesPath;

  Slider(
      {this.width = double.infinity,
      this.height = 300.0,
      this.color = Colors.red,
      this.items,
      this.imagesPath});

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        10,
      ),
      height: this.widget.height,
      width: this.widget.width,
      color: this.widget.color,
      child: (widget.items == null || widget.items.length <= 0) &&
              (widget.imagesPath == null || widget.imagesPath.length <= 0)
          ? Container()
          : PageView.builder(
              // store this controller in a State to save the carousel scroll position
              controller: PageController(viewportFraction: 0.85),
              onPageChanged: (int index) => setState(() => _index = index),
              itemBuilder: (BuildContext context, int itemIndex) {
                return (widget.items == null || widget.items.length <= 0)
                    ? widget.items[itemIndex]
                    : myImageSliderBanner(
                        itemIndex); //_buildCarouselItem(context, 0, itemIndex);
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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

  Widget myImageSliderBanner(var index) {
    int _index = 0;
    return Transform.scale(
      scale: 0.98,
      child: Card(
        elevation: 3,
        color: Colors.pink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(
              20,
            )),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.greenAccent,
                  ),
                ),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.imagesPath[index].isEmpty
                        ? ""
                        : widget.imagesPath[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
