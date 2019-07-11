import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model {
  int _count = 2;
  get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  static CountModel of(BuildContext context) =>
      ScopedModel.of<CountModel>(context, rebuildOnChange: true);
}

CountModel COUNT_MOUDEL=CountModel();