import 'package:ecommerce_assissment/Models/Registrationmodel.dart';
import 'package:ecommerce_assissment/Services/Signupservice.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier{
  RegistrationModel?registrationModel;
  Future<bool>addsignupprovider(String name,String email,String phone,String password)async{
    try{
      registrationModel = await SignUpService.adddata(name, email, phone, password);
      if(registrationModel?.status == true){
        notifyListeners();
        return true;
      }
      else{
        throw Exception('Error in Signup');
      }
    }catch(s){
      print(s);
      notifyListeners();
      return false;
    }
  }
}