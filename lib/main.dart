import 'package:ecommerce_assissment/Providers/Productprovider.dart';
import 'package:ecommerce_assissment/Providers/Signinprovider.dart';
import 'package:ecommerce_assissment/Screens/Registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/Signupprovider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductProvider(),),
      ChangeNotifierProvider(create: (context) => SigninProvider(),),
    ChangeNotifierProvider(create: (context) => SignupProvider(),)
  ],child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registration(),
    );
  }
}


