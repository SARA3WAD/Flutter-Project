import 'package:dio/dio.dart';
import 'package:ecommerce_assissment/Models/Registrationmodel.dart';

class SignUpService{
  static Dio dio = Dio();
  static Future<RegistrationModel> adddata(String name,String email,String phone,String password) async{
    try{
      Response response = await dio.post('https://student.valuxapps.com/api/register',
      data: {
        "name": name,
        "email": email,
        "phone": phone,
        "password":password
      });
      if(response.statusCode == 200){
        print(response.data);
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