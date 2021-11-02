import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// ---------------- TEST --------------------- //
Future<Recipes> fetchRecipes() async {
  final response = await http
      .get(Uri.parse('http://localhost:3000/recipes'));

  if (response.statusCode == 200) {
    debugPrint(jsonDecode(response.body).toString());
    return Recipes.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load recipes');
  }
}

class Recipes {
  final int userId;
  final int id;
  final String title;

  Recipes({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
// ---------------- END --------------------- //

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