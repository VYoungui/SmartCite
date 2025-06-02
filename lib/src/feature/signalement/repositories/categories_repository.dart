import 'package:flutter/foundation.dart';
import 'package:smart_cite/src/feature/dto/request/categories_request.dart';
import 'package:smart_cite/src/feature/signalement/model/categories_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class CategoriesRepository{

  Future<List<Categories>> Create_Categories (CategoriesRequest categoriesRequest) async {
    final data_categories = await Supabase.instance.client.from('mobiles_app.categrories').insert(categoriesRequest).select();
    if (kDebugMode) {
      print(data_categories);
    }
    List<Categories> categories = [];
    for (var element in data_categories) {
      categories.add(Categories.fromJson(element));
    }
    return categories;
  }

  Future<List<Categories>> Get_Categories () async {
    final data_categories = await Supabase.instance.client.from('mobiles_app.categories').select();
    if (kDebugMode) {
      print(data_categories);
    }
    List<Categories> categories = [];
    for (var element in data_categories) {
      categories.add(Categories.fromJson(element));
    }
    return categories;
  }

  Future<List<Categories>> Update_Categories (CategoriesRequest categoriesRequest) async {
    final dataCategories = await Supabase.instance.client.from('mobiles_app.categories').select().eq("name", categoriesRequest.name);
    //if(dataCategories == null) throw new Exception("Categories Not Found");
    //final hash = _passwordEncoder

    final data = await Supabase.instance.client.from('mobiles_app.categories').update({'name': categoriesRequest.name}).eq("name", categoriesRequest.name);
    if (kDebugMode) {
      print(dataCategories);
    }
    List<Categories> categories = [];
    for (var element in data) {
      categories.add(Categories.fromJson(element));
    }
    return categories;
  }

  Future<List<Categories>> Delete_Categories (int id) async {
    final data_categories = await Supabase.instance.client.from('mobiles_app.categories').select().eq("id", id);
    if (kDebugMode) {
      print(data_categories);
    }
    await Supabase.instance.client.from("mobile_app.categories").delete().eq("id", id).select();
    List<Categories> categories = [];
    for (var element in data_categories) {
      categories.add(Categories.fromJson(element));
    }
    return categories;

  }



}