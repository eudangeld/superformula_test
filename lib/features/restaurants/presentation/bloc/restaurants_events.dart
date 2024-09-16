import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant_details.dart';

abstract class RestaurantEvent {}

class GetRestaurantsListEvent extends RestaurantEvent {}

class SaveFavoriteEvent extends RestaurantEvent {
  final RestaurantDetails restaurant;

  SaveFavoriteEvent({required this.restaurant});
}

class GetRestaurantDetailsEvent extends RestaurantEvent {
  final String restaurantId;

  GetRestaurantDetailsEvent({required this.restaurantId});
}
