import 'package:flutter/cupertino.dart';

class FavoriteChangeNotifier with ChangeNotifier{
  bool _isFavorited;
  final int _favoritedCount;

  FavoriteChangeNotifier(this._isFavorited, this._favoritedCount);
  //des getters
  bool get isFavorited => _isFavorited;
  int get favoritedCount => _favoritedCount + (_isFavorited ?1 :0 );

  set isFavorited(bool isFavorited) {
    _isFavorited = isFavorited;
    notifyListeners();
  }
}