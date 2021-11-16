// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:Cook/api/services.dart';
import 'package:Cook/model/recipes_list.dart';
import 'package:Cook/screens/detail_screen.dart';
import 'package:Cook/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:Cook/main.dart';

void main() {
  test('Initialize with empty', () async {
    var mockRepo = MockRecipesRepo();

    var list = mockRepo.getRecipesList();
    expect(list, <Recipes>[]);
  });

  testWidgets('home Has Title Screen', (WidgetTester tester) async {
    await tester.pumpWidget(HomeScreen());

    final titleFinder = find.text('Looking for your favorite meal');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('detailed Screen', (WidgetTester tester) async {
    await tester.pumpWidget(DetailRecipes());

    final ingFinder = find.text('Ingredients');

    expect(ingFinder, findsOneWidget);
  });
}

var mockRecipes = <Recipes>[
  Recipes(
      name: "test1",
      id: "1",
      description: "test etsts ",
      tag: ["1", "2"],
      image: "",
      ingredient: [],
      ingredientGroup: [],
      step: [],
      notes: " notes ",
      forked: "forked"),
  Recipes(
      name: "test1",
      id: "2",
      description: "test etsts ",
      tag: ["1", "2"],
      image: "",
      ingredient: [],
      ingredientGroup: [],
      step: [],
      notes: " notes ",
      forked: "forked"),
  Recipes(
      name: "test1",
      id: "3",
      description: "test etsts ",
      tag: ["1", "2"],
      image: "",
      ingredient: [],
      ingredientGroup: [],
      step: [],
      notes: " notes ",
      forked: "forked"),
  Recipes(
      name: "test1",
      id: "4",
      description: "test etsts ",
      tag: ["1", "2"],
      image: "",
      ingredient: [],
      ingredientGroup: [],
      step: [],
      notes: " notes ",
      forked: "forked")
];

class MockRecipesRepo implements RecipesRepo {
  @override
  Future<List<Recipes>> getRecipesList() async =>
      Future.delayed(const Duration(seconds: 2), () => [...mockRecipes]);
}
