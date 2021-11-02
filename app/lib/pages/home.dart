import 'package:flutter/material.dart';
import 'dart:async';
import 'package:Cook/network/api.dart';


class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  HomeBodyState();

  late Future<Recipes> futureRecipes;

  @override
  void initState() {
    super.initState();
    futureRecipes = fetchRecipes();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget> [
        SizedBox(height: 20),
        Center(
        child: Text("I'm looking for a recipe", style: TextStyle(fontWeight: FontWeight.w500)),
        ),
        Icon(
          Icons.favorite,
          size: 150,
        ),
      ],
    );
  }
}