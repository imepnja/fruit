import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fruithero/constants.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:fruithero/models/food.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = ScrollController();

  final List<Food> _foodItems = [
    Food(name: 'Salmon', price: '\$20.00', imgUrl: 'assets/plate5.png'),
    Food(name: 'Salmon', price: '\$20.00', imgUrl: 'assets/plate5.png'),
    Food(name: 'Salmon', price: '\$20.00', imgUrl: 'assets/plate5.png'),
    Food(name: 'Salmon', price: '\$20.00', imgUrl: 'assets/plate5.png'),
    Food(name: 'Salmon', price: '\$20.00', imgUrl: 'assets/plate5.png'),
    Food(name: 'Salmon', price: '\$20.00', imgUrl: 'assets/plate5.png'),
    Food(name: 'Salmon', price: '\$20.00', imgUrl: 'assets/plate5.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackground,
      body: Column(

        children: <Widget>[
          // menu bar
          SizedBox(height: 20),
          appBar(),
          SizedBox(height: 25),
          // home
          Expanded(
            // rounded white box
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
              ),
              padding: EdgeInsets.only(left: 25, right: 20, top: 30),

              // food

              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)),
                      child: FadingEdgeScrollView.fromScrollView(
                        child: ListView.builder(
                          controller: _controller,
                          scrollDirection: Axis.vertical,
                          primary: false,
                          itemCount: _foodItems.length,
                          itemBuilder: (context, index) {
                            return _foodItems[index].getItemTile();
                          
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                    child: bottomButtons(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomButtons() {
    final double buttonSize = 70;

    // Buttons
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // search button
        InkWell(
          child: Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[800],
                  style: BorderStyle.solid,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(child: Icon(Icons.search)),
          ),
        ),

        // search button
        InkWell(
          child: Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[800],
                  style: BorderStyle.solid,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(child: Icon(Icons.shopping_cart)),
          ),
        ),

        // search button
        InkWell(
          child: Container(
            width: buttonSize * 2,
            height: buttonSize,
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.grey[800],
                  style: BorderStyle.solid,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
                child: Text(
              'Checkout',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 18,
              ),
            )),
          ),
        ),
      ],
    );
  }

  Widget appBar() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () {},
              ),
              Container(
                width: 115,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.filter_list),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),

        // Title
        Padding(
          padding: EdgeInsets.only(left: 40),
          child: Row(
            children: <Widget>[
              Text(
                'Healthy',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 6),
              Text(
                'Food',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
