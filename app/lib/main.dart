import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Cook/navigation.dart';


void main(){

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_){
    runApp(MyApp());
  }
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white60),
      home: const NavPage(title: 'Cook my life',),
      debugShowCheckedModeBanner: false,
    );
  }
}
