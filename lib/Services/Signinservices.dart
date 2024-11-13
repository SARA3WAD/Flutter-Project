import 'package:dio/dio.dart';
import 'package:ecommerce_assissment/Models/Registrationmodel.dart';

class SigninService{
  static Dio dio = Dio();
  static Future<RegistrationModel>addsignin(String email,String password) async{
    try{
      Response response = await dio.post('https://student.valuxapps.com/api/login',
      data:
      {
        "email": email,
        "password":password
      });
      if(response.statusCode == 200){
        return RegistrationModel.fromjson(response.data);
      }
      else{
        throw Exception('Error');
      }
    }
    catch(s){
      throw Exception(s);
    }
  }
}