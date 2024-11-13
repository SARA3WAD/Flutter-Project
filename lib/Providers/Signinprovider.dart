import 'package:ecommerce_assissment/Models/Registrationmodel.dart';
import 'package:ecommerce_assissment/Services/Signinservices.dart';
import 'package:ecommerce_assissment/Services/Signupservice.dart';
import 'package:flutter/material.dart';

class SigninProvider with ChangeNotifier{
  RegistrationModel?registrationModel;
  Future<bool>checksignin(String email,String password)async{
    try{
      registrationModel = await SigninService.addsignin( email,password);
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