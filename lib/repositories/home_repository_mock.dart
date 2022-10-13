import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences_flutter/models/post_model.dart';

import 'home_repostory.dart';

class HomeMock implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');
    List postJson = jsonDecode(value);
    return postJson.map((e) => PostModel.fromJson(e)).toList();
  }
}
