import 'sign_in_form.dart';
import 'package:rive_animation/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
 
 final  _emailController = TextEditingController();
final _passwordController = TextEditingController();

 
  
  @override
  void dispose(){
_emailController.dispose();
 _passwordController.dispose();
 super.dispose();
}

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      body: Center(

     child: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            

            
            Padding(
            
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            
            ElevatedButton(
              onPressed: (){
               SignUp();
              Navigator.pop(
                  context,
            MaterialPageRoute(builder: (context) => SignInForm()),
                );
              },
              child: Text('Signup'),
            ),
          ]
            )
     
        
        ),
      ),
    );
  }
  Future SignUp() async{
     showDialog(context: context,barrierDismissible: false, 
    builder: (context)=> Center(child: CircularProgressIndicator()));
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(), password: _passwordController.text.trim());
    }on FirebaseAuthException catch(e){
      print(e);
    }
      navigatorKey.currentState!.popUntil((route)=> route.isFirst);
  }
}