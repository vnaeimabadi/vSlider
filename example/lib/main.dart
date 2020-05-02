import 'package:flutter/material.dart';
import 'package:vSlider/v_slider.dart' as cslider;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> itemList = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    itemList.add(mySliderItems(1));
    itemList.add(mySliderItems(2));
    itemList.add(mySliderItems(3));
    itemList.add(mySliderItems(4));
    itemList.add(mySliderItems(5));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: cslider.Slider(
              items: itemList,
            ),
          ),
        ),
      ),
    );
  }

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
}
