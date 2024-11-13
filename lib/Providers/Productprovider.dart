import 'package:ecommerce_assissment/Models/Productsmodel.dart';
import 'package:ecommerce_assissment/Services/Productservice.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{
  ProductModel? productModel;
  Future<void> addprovider()async{
    productModel = await ProductService.getdata();
    notifyListeners();
  }
}