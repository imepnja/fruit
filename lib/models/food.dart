import 'package:flutter/material.dart';

class Food {
  final String name;
  final String price;
  final String imgUrl;

  Food({this.name, this.price, this.imgUrl});

  Widget getItemTile(){
     return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 10, bottom: 20),
      child: InkWell(
        onTap: () {
          print('tap');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  // img
                  Hero(
                    tag: imgUrl,
                    child: Image(
                      image: AssetImage(imgUrl),
                      fit: BoxFit.cover,
                      height: 75,
                      width: 75,
                    ),
                  ),

                  // text
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //name
                      Text(
                        name,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      // price
                      Text(
                        price,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

}