import 'package:restaurant_tour/features/restaurants/data/models/restaurant_model.dart';

abstract class FavoritesLocalDataSource {
  Future<List<RestaurantModel>> list();
  Future<void> save(RestaurantModel restaurant);
  Future<void> delete(String id);
  Future<bool> exist(String id);
}
