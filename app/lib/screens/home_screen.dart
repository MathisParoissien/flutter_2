import 'package:Cook/bloc/recipes/bloc.dart';
import 'package:Cook/bloc/recipes/states.dart';
import 'package:Cook/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Cook/model/recipes_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  ///Image paths and food names
  final images = [
    "assets/burger.jpg",
    "assets/chicken_g.jpg",
    "assets/chiken_f.jpeg",
    "assets/pizza.jpg",
    "assets/spaghetti.jpg",
  ];

  final foodNames = [
    "Grilled Burger",
    "Crispy Fried Chicken",
    "Grilled Chicken",
    "Pasta",
    "Pizza"
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _list(List<Recipes> recipes) {
    return Expanded(
      child: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (_, index) {
          Recipes _recipes = recipes[index];
          var tags = recipes[index].tag;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailRecipes(recipe: _recipes)));
            },
            child: AspectRatio(
                aspectRatio: 0.9 / 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Hero(
                        child: Container(
                          child: ClipRRect(
                            child: Image.network(
                              _recipes.image!,
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                            BorderRadius.circular(30),
                          ),
                        ),
                        tag: _recipes.image!,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0),
                      child: Text(
                        _recipes.name!,
                        style: GoogleFonts.roboto(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0),
                      child: Text(
                        tags!.isNotEmpty ?
                        _recipes.tag!.join(", ") : "",
                        style: GoogleFonts.roboto(
                            color: Colors.grey[600],
                            fontSize: 11),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<Widget> _pages = <Widget>[
      SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Looking for your favorite meal",
                          style: GoogleFonts.playfairDisplay(fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.grey[800],
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications_none),
                        color: Colors.grey[800],
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),

                ///Container For List of Recipes type
                ///Give 25 percent height relative to screen
                Container(
                  height: size.height * 0.25,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AspectRatio(
                            aspectRatio: 0.9 / 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: ClipRRect(
                                      child: Image.asset(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    "${foodNames[index]} Recipes",
                                    style: GoogleFonts.roboto(
                                        color: Colors.grey[800], fontSize: 11),
                                  ),
                                )
                              ],
                            ));
                      },
                      separatorBuilder: (context, _) => SizedBox(
                            width: 16,
                          ),
                      itemCount: 4),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: size.height * 0.4,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(images[4 - index])));
                          },
                          child: AspectRatio(
                              aspectRatio: 0.9 / 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Hero(
                                      child: Container(
                                        child: ClipRRect(
                                          child: Image.asset(
                                            images[4 - index],
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      tag: images[4 - index],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      "${foodNames[4 - index]}",
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey[800],
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      "Recipe by Sarah Ahmed",
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey[600],
                                          fontSize: 11),
                                    ),
                                  )
                                ],
                              )),
                        );
                      },
                      separatorBuilder: (context, _) => SizedBox(
                            width: 16,
                          ),
                      itemCount: 4),
                ),
              ],
            ),
          ),
        ),
      ),
      SafeArea(
          child: Container(
        width: double.infinity,
              child: Column(
                  children: [(BlocBuilder<RecipesBloc, RecipesState>(
                      builder: (BuildContext context, RecipesState state) {
                        if (state is RecipesListError) {
                          final error = state.error;
                          return Text(error.message);
                        }
                        if (state is RecipesLoaded) {
                          List<Recipes> recipes = state.recipes;
                          return _list(recipes);
                        }
                        return CircularProgressIndicator();
                      }))])
      )),
      SafeArea(
          child: Container(
        width: double.infinity,
      )),
      SafeArea(
          child: Container(
            width: double.infinity,
          )),
    ];

    return Scaffold(
      body: SafeArea(
        child: _pages.elementAt(selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), title: Text("Recipes")),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), title: Text("Subscription")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings")),
        ],
        iconSize: 30,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}