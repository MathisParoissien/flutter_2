import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// Future<Recipes> fetchRecipes() async {
//   final response = await http.get(Uri.parse('http://10.0.2.2:3000/recipes'));

//   if (response.statusCode == 200) {
//     debugPrint(jsonDecode(response.body).toString());
//     return Recipes.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load recipes');
//   }
// }

List<Recipes> recipesFromJson(String str) =>
    List<Recipes>.from(json.decode(str).map((x) => Recipes.fromJson(x)));

class Recipes {
  final String name;
  final String id;
  final String image;

  Recipes({
    required this.name,
    required this.id,
    required this.image,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
        name: json['name'],
        id: json['id'],
        image: json['image'],
      );
}
