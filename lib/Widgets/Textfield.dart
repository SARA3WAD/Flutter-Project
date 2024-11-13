import 'package:flutter/material.dart';
class MyTextFeild extends StatelessWidget {
   MyTextFeild({super.key,required this.mycontroller,required this.mytext,required this.myvalidate});
TextEditingController mycontroller;
String? Function(String?) myvalidate;
String mytext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40,),
        Container(
          width: 400,
          child: TextFormField(
            controller: mycontroller,
            decoration: InputDecoration(
              hintText: mytext,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
            validator: myvalidate,
          ),
        )
      ],
    );
  }
}
