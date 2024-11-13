import 'package:ecommerce_assissment/Providers/Signinprovider.dart';
import 'package:ecommerce_assissment/Providers/Signupprovider.dart';
import 'package:ecommerce_assissment/Screens/Signin.dart';
import 'package:ecommerce_assissment/Widgets/Textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    var object = Provider.of<SignupProvider>(context);
    TextEditingController name= TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    var mykey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Register',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Form(
        key: mykey,
        child: Center(
          child: Column(
            children: [
              MyTextFeild(mycontroller: name, mytext: 'Enter username', myvalidate: (ss){
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
              SizedBox(height: 20,),
              MyTextFeild(mycontroller: password, mytext: 'Enter password', myvalidate: (ss){
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
              SizedBox(height: 20,),
              MyTextFeild(mycontroller: phone, mytext: 'Enter phone number', myvalidate: (ss){
                if(ss == null || ss.isEmpty){
                  return 'Please Fill the textbox';
                }
                else if(ss.length < 11){
                  return 'Your name must be 11';
                }
                else{
                  return null;
                }
              }),
              SizedBox(height: 20,),
              MyTextFeild(mycontroller: email, mytext: 'Enter Email', myvalidate: (ss){
                if(ss == null || ss.isEmpty){
                  return 'Please Fill the textbox';
                }
                else{
                  return null;
                }
              }),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: () async{
                if(mykey.currentState !.validate()){
                  bool signup = await object.addsignupprovider(name.text, email.text, phone.text, password.text);
                  if(signup){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Signin(),));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed')));
                  }
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill the textboxes')));
                }
              }, child: Text('SignUp')),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Signin(),));
              }, child: Text('Already have an account'))
            ],
          ),
        ),
      ),
    );
  }
}
