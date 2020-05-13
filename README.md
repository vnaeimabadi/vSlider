# vSlider

A new Flutter package project.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

List<Widget> itemList = [];

itemList.add(mySliderItems(1));
itemList.add(mySliderItems(2));
itemList.add(mySliderItems(3));
itemList.add(mySliderItems(4));
itemList.add(mySliderItems(5));

Container(
            child: cslider.Slider(
              items: itemList,
            ),
          )

Widget mySliderItems(int index) {
  int _index = 0;
  return Transform.scale(
    scale: index == _index ? 1 : 0.9,
    child: Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          "Card ${index + 1}",
          style: TextStyle(fontSize: 32),
        ),
      ),
    ),
  );
}
