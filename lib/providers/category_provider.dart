import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kbti_app/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  getCategory() async {
    var url = Uri.parse('https://kbti-api.herokuapp.com/categories');

    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body)['data'];
      //MAPPING TO CATEGORY OBJECT
      List<Category> categories =
          data.map((e) => Category.fromJson(e)).toList();
      // MAPPING OBJECT TO STRING
      // List<String> categoriesList =
      //     categories.map((e) => e.category.toString()).toList();

      return categories;
    } else {
      <String>[];
    }
  }
}