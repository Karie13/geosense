import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/entryPoint/entry_point.dart';
import 'package:rive_animation/screens/onboding/onboding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rive_animation/services/firebase_auth.dart';
import 'firebase_options.dart';

// ...



Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  
);
}
final navigatorKey=GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
   
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       navigatorKey: navigatorKey,
      title: 'GEOSENSE',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEEF1F8),
        primarySwatch: Colors.blue,
        fontFamily: "Intel",
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
      ),
      home: const OnbodingScreen(),
    );
  }
}
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
     builder:((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }else if(snapshot.hasError){
        return Center(child: Text('Something went wrong!'),);
      }else if (snapshot.hasData){
        return EntryPoint();
       }else{
        return AuthPage();
       }
     })
  ));

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);