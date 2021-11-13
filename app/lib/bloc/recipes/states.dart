import 'package:Cook/model/recipes_list.dart';
import 'package:equatable/equatable.dart';

abstract class RecipesState extends Equatable {
  @override
  List<Object> get props => [];
}

class RecipesInitialState extends RecipesState {}

class RecipesLoading extends RecipesState {}

class RecipesLoaded extends RecipesState {
  final List<Recipes> recipes;
  RecipesLoaded(this.recipes);
}

class RecipesListError extends RecipesState {
  final error;
  RecipesListError({this.error});
}
