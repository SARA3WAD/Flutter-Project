import 'package:ecommerce_assissment/Providers/Signinprovider.dart';
import 'package:ecommerce_assissment/Screens/Products.dart';
import 'package:ecommerce_assissment/Screens/Registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/Textfield.dart';
class Signin extends StatelessWidget {
   Signin({super.key});

  @override
  Widget build(BuildContext context) {
    var object = Provider.of<SigninProvider>(context);
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    var mykey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Signin',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Form(
            key: mykey,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Container(
                    width: 200,
                      height: 200,
                      child:
                  CircleAvatar(child:
                  Image.network('https://cdn-icons-png.flaticon.com/512/625/625119.png'))),
                  MyTextFeild(mycontroller: email, mytext: 'Enter Your email', myvalidate: (ss){
                    if(ss == null || ss.isEmpty){
                      return 'Please Fill the textbox';
                    }
                    else if(ss.length < 4){
                      return 'Your name must be at least 4';
                    }
                    else{
                      return null;
                    }
                  }),
                  SizedBox(height: 30,),
                  MyTextFeild(mycontroller: password, mytext: 'Enter Your password', myvalidate: (ss){
                    if(ss == null || ss.isEmpty){
                      return 'Please Fill the textbox';
                    }
                    else if(ss.length < 4){
                      return 'Your name must be at least 4';
                    }
                    else{
                      return null;
                    }
                  }),
                  SizedBox(height: 50,),
                  ElevatedButton(onPressed: () async{
                    if(mykey.currentState !.validate()){
                      bool signup = await object.checksignin( email.text, password.text);
                      if(signup){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Products(),));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed')));
                      }
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill the textboxes')));
                    }
                  }, child: Text('Signin')),
                  SizedBox(height: 20,),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Registration(),));
                  }, child: Text('Don’t have an account'))
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
