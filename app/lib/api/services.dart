import 'package:Cook/model/recipes_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

abstract class RecipesRepo {
  Future<List<Recipes>> getRecipesList();
}

class RecipesService implements RecipesRepo {
  static const _baseUrl = '10.0.2.2:3000';
  static const String _GET_RECIPES = '/recipes';

  @override
  Future<List<Recipes>> getRecipesList() async {
    Uri uri = Uri.https(_baseUrl, _GET_RECIPES);
    Response response =
        await http.get(Uri.parse('http://10.0.2.2:3000/recipes'));
    List<Recipes> recipes = recipesFromJson(response.body);
    return recipes;
  }
}
