import 'package:ecommerce_assissment/Providers/Productprovider.dart';
import 'package:ecommerce_assissment/Widgets/Gridview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Productsinformation extends StatelessWidget {
  Productsinformation({super.key,required this.image,
    required this.name,
    required this.description});
  String image;
  String name;
  String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More details',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),),
        backgroundColor: Colors.blueGrey,
      ),
      body: Consumer<ProductProvider>(builder: (context, object, child) {
        final result = object.productModel;
        if(result == null){
          object.addprovider();
          return Center(child: CircularProgressIndicator());
        }
        else{
          return ListView.builder(itemBuilder: (context, index) {
            Column(
              children: [
                SizedBox(height: 50,),
                Image.network(image),
                SizedBox(height: 10,),
                Text(name),
                SizedBox(height: 10,),
                Text(description)
              ],
            );
          },);
        }
      },),
    );
  }
}
