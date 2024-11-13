import 'package:ecommerce_assissment/Screens/Information.dart';
import 'package:flutter/material.dart';
class Mygridview extends StatelessWidget {
   Mygridview({super.key,
   required this.image,
   required this.name,
   required this.price});
String image;
String name;
String price;
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
        GridView.count(crossAxisCount: 2,
        children: [
          Image.network(image),
          SizedBox(height: 10,),
          Text(name),
          SizedBox(height: 10,),
          Text(price)
        ],
      mainAxisSpacing: 10,crossAxisSpacing: 10,),
        ],
    );
  }
}
