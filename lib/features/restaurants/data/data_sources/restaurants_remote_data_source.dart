import 'package:restaurant_tour/features/restaurants/data/models/restaurant_details_model.dart';
import 'package:restaurant_tour/features/restaurants/data/models/restaurant_model.dart';

abstract class RestaurantsRemoteDataSource {
  Future<List<RestaurantModel>> restaurantsList();
  Future<RestaurantDetailsModel> restaurantDetails(String restaurantId);
}
