import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/recipeScreen.dart';

import 'recipe.dart';

class RecipeListeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RecipeListeScreenState();
  }
}

class RecipeListeScreenState extends State<RecipeListeScreen>{

  final List<Recipe> recipes = [
    Recipe(
        "ordinateur",
        "Par papa matar",
        "https://picsum.photos/250?image=9",
        "Here we take the value from the MyHomePage object that was created bthe App.build method, and use it to set our appbar title.",
        false,
        50
    ),
    Recipe(
        "pizza facile",
        "Par papa matar",
        "https://assets.afcdn.com/recipe/20161216/61596_w1024h768c1cx2808cy1872.webp",
        "Here we take the value from the MyHomePage object that was created bthe App.build method, and use it to set our appbar title.",
        false,
        50
    ),
    Recipe(
        "burger",
        "Par papa matar",
        "https://assets.afcdn.com/recipe/20161216/61596_w1024h768c1cx2808cy1872.webp",
        "Here we take the value from the MyHomePage object that was created bthe App.build method, and use it to set our appbar title.",
        false,
        50
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes recettes"),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context,index){
          final recipe =recipes[index];
          return Dismissible(key: Key(recipe.title),
              onDismissed: (direction){
                setState(() {
                  recipes.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${recipe.title} supprimé"))
                );
              },
              background: Container(color: Colors.red),
              child: RecipeItemWidget(recipe: recipe))
            ;
        },
      )
        
        
        
        
      /*ListView(
        children: [
      RecipeItemWidget(
          recipe: Recipe(
            "pizza facile",
                "Par papa matar",
                "https://picsum.photos/250?image=9",
                "Here we take the value from the MyHomePage object that was created bthe App.build method, and use it to set our appbar title.",
                false,
                50
          )
      ),
      RecipeItemWidget(
          recipe: Recipe(
              "pizza facile",
              "Par papa matar",
              "https://assets.afcdn.com/recipe/20161216/61596_w1024h768c1cx2808cy1872.webp",
              "Here we take the value from the MyHomePage object that was created bthe App.build method, and use it to set our appbar title.",
              false,
              50
          )
      )
          /*ListTile(
            leading: Icon(Icons.fastfood),
            title: Text("Burger maison"),
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text("Pizza maison"),
          ),*/
        ],
      ),*/
    );

  }
}

class RecipeItemWidget extends StatelessWidget{

  RecipeItemWidget({  required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
          PageRouteBuilder(
              pageBuilder:(context,animation,secondaryAnimation)=> RecipeScreen(recipe: recipe),
              transitionsBuilder:(context,animation,secondaryAnimation,child){
                  /*var begin = Offset(0.0, 0.1);
                  var end =Offset.zero;
                  var curve  = Curves.ease;
                  var tween =Tween(begin: begin,end: end).chain(CurveTween(curve: curve));*/
                  animation = CurvedAnimation(curve: Curves.ease,parent: animation);
                return FadeTransition(
                      opacity: animation,
                     child: child
                  );
              }
          )
        );
      },
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 5,
        child: Row(
          children: [
            Hero(
              tag: "imageRecipe"+recipe.title,
              child: CachedNetworkImage(imageUrl: recipe.imageUrl,
                placeholder: (context,url)=>
                Center(child: CircularProgressIndicator()),
                errorWidget: (context,url,error)=>Icon(Icons.error),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                    Text(recipe.user,
                      style: TextStyle(color: Colors.grey[500],fontSize: 16),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}