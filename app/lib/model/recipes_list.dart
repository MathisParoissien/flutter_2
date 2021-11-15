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



/*
List<Recipes> recipesFromJson(String str) =>
    List<Recipes>.from(json.decode(str).map((x) => Recipes.fromJson(x)));

class Recipes {
  final String name;
  final String id;
  final String image;
  final String description;
  //List<String> tags;

  Recipes({
    required this.name,
    required this.id,
    required this.image,
    required this.description,
    //required this.tags,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
        name: json['name'],
        id: json['id'],
        image: json['image'],
        description: json['description'],

      );
} */
// To parse this JSON data, do
//
//     final recipes = recipesFromJson(jsonString);

// To parse this JSON data, do
//
//     final recipes = recipesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Recipes> recipesFromJson(String str) => List<Recipes>.from(json.decode(str).map((x) => Recipes.fromJson(x)));

String recipesToJson(List<Recipes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipes {
  Recipes({
    required this.name,
    required this.id,
    required this.description,
    required this.tag,
    required this.image,
    required this.ingredient,
    required this.ingredientGroup,
    required this.step,
    required this.notes,
    required this.forked,
  });

  String ?name;
  String ?id;
  String ?description;
  List<String> ?tag;
  String ?image;
  List<Ingredient> ?ingredient;
  List<dynamic> ?ingredientGroup;
  List<Step> ?step;
  String ?notes;
  String ?forked;

  factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
    name: json["name"] ?? null,
    id: json["id"] ?? null,
    description: json["description"] ?? null,
    tag: json["tag"] == null ? null : List<String>.from(json["tag"].map((x) => x)),
    image: json["image"] ?? null,
    ingredient: json["ingredient"] == null ? null : List<Ingredient>.from(json["ingredient"].map((x) => Ingredient.fromJson(x))),
    ingredientGroup: json["ingredientGroup"] == null ? null : List<dynamic>.from(json["ingredientGroup"].map((x) => x)),
    step: json["step"] == null ? null : List<Step>.from(json["step"].map((x) => Step.fromJson(x))),
    notes: json["notes"] ?? null,
    forked: json["forked"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "name": name ?? null,
    "id": id ?? null,
    "description": description ?? null,
    "tag": tag == null ? null : List<dynamic>.from(tag!.map((x) => x)),
    "image": image ?? null,
    "ingredient": ingredient == null ? null : List<dynamic>.from(ingredient!.map((x) => x.toJson())),
    "ingredientGroup": ingredientGroup == null ? null : List<dynamic>.from(ingredientGroup!.map((x) => x)),
    "step": step == null ? null : List<dynamic>.from(step!.map((x) => x.toJson())),
    "notes": notes ?? null,
    "forked": forked ?? null,
  };
}

class Ingredient {
  Ingredient({
    required this.amount,
    required this.unit,
    required this.name,
    required this.preparation,
  });

  String ?amount;
  String ?unit;
  String ?name;
  String ?preparation;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    amount: json["amount"] ?? null,
    unit: json["unit"] ?? null,
    name: json["name"] ?? null,
    preparation: json["preparation"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "amount": amount ?? null,
    "unit": unit ?? null,
    "name": name ?? null,
    "preparation": preparation ?? null,
  };
}

class Step {
  Step({
    required this.description,
  });

  String description;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "description": description == null ? null : description,
  };
}
