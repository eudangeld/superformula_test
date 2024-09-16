import 'package:restaurant_tour/features/restaurants/data/models/restaurant_model.dart';

abstract class RestaurantsRemoteDataSource {
  Future<List<RestaurantModel>> restaurantsList();
  Future<List<RestaurantModel>> restaurantDetails();
}
