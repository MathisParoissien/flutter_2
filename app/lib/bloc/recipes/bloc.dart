import 'dart:io';

import 'package:Cook/api/exceptions.dart';
import 'package:Cook/api/services.dart';
import 'package:Cook/bloc/recipes/events.dart';
import 'package:Cook/bloc/recipes/states.dart';
import 'package:Cook/model/recipes_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesBloc extends Bloc<RecipesEvents, RecipesState> {
  //
  final RecipesRepo recipesRepo;
  RecipesBloc(this.recipesRepo) : super(RecipesInitialState());

  @override
  Stream<RecipesState> mapEventToState(RecipesEvents event) async* {
    //
    switch (event) {
      case RecipesEvents.fetchRecipes:
        yield RecipesLoading();
        try {
          List<Recipes> recipes = await recipesRepo.getRecipesList();
          yield RecipesLoaded(recipes);
        } on SocketException {
          yield RecipesListError(error: NoInternetException("No Internet"));
        } on HttpException {
          yield RecipesListError(
              error: NoServiceFoundException("No Service Found"));
        } on FormatException {
          yield RecipesListError(
              error: InvalidFormatException("Invalid Response format"));
        } catch (e) {
          debugPrint(e.toString());
          yield RecipesListError(error: UnknownException(e.toString()));
        }

        break;
    }
  }
}
