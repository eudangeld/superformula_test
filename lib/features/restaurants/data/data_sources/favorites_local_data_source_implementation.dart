import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/restaurant_model.dart';
import 'favorites_local_data_source.dart';

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final SharedPreferences localStorage;

  FavoritesLocalDataSourceImpl({required this.localStorage});

  final String favoritesKey = 'favorites';

  @override
  Future<void> delete(String id) async {
    await localStorage.remove('${favoritesKey}_$id');
  }

  @override
  Future<List<RestaurantModel>> list() async {
    final storageKeys = localStorage.getKeys();
    final List<RestaurantModel> response = [];

    for (final key in storageKeys) {
      if (key.startsWith(favoritesKey)) {
        final modelString = localStorage.getString(key);
        final model = RestaurantModel.fromJson(jsonDecode(modelString!));
        response.add(model);
      }
    }
    return response;
  }

  @override
  Future<void> save(RestaurantModel restaurant) async {
    final restaurantString = jsonEncode(restaurant.toJson());
    localStorage.setString(
        '${favoritesKey}_${restaurant.id}', restaurantString);
  }

  @override
  Future<bool> exist(String id) async {
    try {
      final keys = localStorage.getKeys();
      return keys.contains('${favoritesKey}_$id');
    } catch (e) {
      return false;
    }
  }
}
