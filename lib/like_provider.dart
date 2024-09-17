import 'package:flutter/material.dart';

class LikeProvider with ChangeNotifier {
  int _likeCount;

  LikeProvider(this._likeCount);

  int get likeCount => _likeCount;

  void like() {
    _likeCount++;
    notifyListeners();
  }

  void unlike() {
    _likeCount--;
    notifyListeners();
  }
}
