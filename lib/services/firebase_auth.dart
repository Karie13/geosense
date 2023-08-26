
import 'package:rive_animation/screens/onboding/components/register.dart';
import 'package:rive_animation/screens/onboding/components/sign_in_form.dart';
import 'package:flutter/material.dart';
class AuthPage extends StatefulWidget{
  @override
  // ignore: library_private_types_in_public_api
  _AuthPageState createState()=> _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  bool isLogin =true;
  @override
  Widget build(BuildContext context) =>
    // TODO: implement build
    isLogin ? SignInForm() : SignupPage();
    void toggle()=> setState (()=> isLogin= !isLogin);
  }

