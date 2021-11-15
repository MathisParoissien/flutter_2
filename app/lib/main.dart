import 'package:Cook/api/services.dart';
import 'package:Cook/bloc/recipes/bloc.dart';
import 'package:Cook/bloc/recipes/events.dart';
import 'package:Cook/bloc/recipes/states.dart';
import 'package:Cook/model/recipes_list.dart';
import 'package:Cook/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => RecipesBloc(RecipesService()),
          child: TestScreen(),
        ));
  }
}

class TestScreen extends StatefulWidget {
  @override
  TestScreenState createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();

    _loadRecipes();
  }

  _loadRecipes() async {
    // ignore: deprecated_member_use
    context.bloc<RecipesBloc>().add(RecipesEvents.fetchRecipes);
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen()
    );
  }
}