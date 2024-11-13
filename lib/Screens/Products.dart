import 'package:ecommerce_assissment/Providers/Productprovider.dart';
import 'package:ecommerce_assissment/Screens/Information.dart';
import 'package:ecommerce_assissment/Widgets/Gridview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Products extends StatelessWidget {
   Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products',style: TextStyle(
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
              return Center(
                child: Card(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                    ),
                   itemCount: result.results.length
                    ,itemBuilder: (context, index) {
                     return InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Productsinformation(
                             image:result.results[index]['image'],
                             name: result.results[index]['name'],
                             description: result.results[index]['description'],),));
                       },
                       child: Mygridview(image: result.results[index]['image'],
                           name: result.results[index]['name'],
                           price: result.results[index]['price'].toString()),
                     );
                   },),
                ),
              );
        }
      },),
    );
  }
}
