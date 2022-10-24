import 'package:flutter/material.dart';
import 'package:flutterproject/recipe.dart';
import 'package:flutterproject/recipeListScreen.dart';
import 'package:flutterproject/recipeScreen.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: RecipeListeScreen()

        /* RecipeScreeen(
        recipe: Recipe(
          "pizza facile",
          "Par papa matar",
          "https://picsum.photos/250?image=9",
          "Here we take the value from the MyHomePage object that was created bthe App.build method, and use it to set our appbar title.",
          false,
          50
        )
      ),*/
        );
  }
}
