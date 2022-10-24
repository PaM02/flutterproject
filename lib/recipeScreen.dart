import 'package:flutter/material.dart';
import 'package:flutterproject/recipe.dart';
import 'package:provider/provider.dart';
import 'favoriteChanfeNotifier.dart';
import 'favoriteWidget.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;
  RecipeScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(8),
        child:Row(
          children: [
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )),
                ),

                Text(recipe.user,
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16
                    )
                )
              ],
            )
            ),
            FavoriteIconWidget(),
            FavoriteTextWidget()
          ],
        )
    );

    Widget buttonSection= Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.comment, "Comment"),
          _buildButtonColumn(Colors.blue, Icons.share, "Share")
        ],
      ),
    );

    Widget desscriptionSection = Container(
      padding: EdgeInsets.all(32),
      child: Text(recipe.description,softWrap:true),
    );

    return ChangeNotifierProvider(
      create: (context) => FavoriteChangeNotifier(recipe.isFavorite,recipe.favoriteCount),
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Mes recettes"),
          ),
          body:ListView(
              children: [
                /*Stack(
                children: [
                  Container(
                    width: 600,
                    height: 240,
                    child: Center(child: CircularProgressIndicator()),
                  ),*/
                Hero(
                  tag: "imageRecipe"+recipe.title,
                  child: FadeInImage.assetNetwork(
                    //https://picsum.photos/250?image=9
                    placeholder: "images/loader_ajax-1.gif",
                    image: recipe.imageUrl,
                    width: 600,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                /*CachedNetworkImage(
                imageUrl: "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
                placeholder: (context,url) =>Center(child: CircularProgressIndicator()),
                errorWidget:(context,url,error) =>Icon(Icons.error),
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),*/
                /* Image.asset(
               // Image.network(src)
                  "images/pizza.jpg",
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
              ),*/
                titleSection,
                buttonSection,
                desscriptionSection
              ]
          )
      ),
    );
  }

  Column _buildButtonColumn(Color color,IconData iconData,String label){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child:
          Icon(iconData,color: color),
        ),
        Text(label,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.w400,
                fontSize: 14
            ))
      ],
    );
  }


}
