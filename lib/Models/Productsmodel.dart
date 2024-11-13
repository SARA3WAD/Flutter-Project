class ProductModel{
List<dynamic>results;
ProductModel({required this.results});
factory ProductModel.fromjson(Map<String,dynamic> json){
  return ProductModel(results: json['data']['products']);
}
}