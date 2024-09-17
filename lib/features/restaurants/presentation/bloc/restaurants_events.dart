import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant_details.dart';

abstract class RestaurantEvent {}

class GetRestaurantsListEvent extends RestaurantEvent {}

class GetFavoriteListEvent extends RestaurantEvent {}

class DeleteFavoriteEvent extends RestaurantEvent {
  final RestaurantDetails restaurantDetails;

  DeleteFavoriteEvent({required this.restaurantDetails});
}

class SaveFavoriteEvent extends RestaurantEvent {
  final RestaurantDetails restaurantDetails;

  SaveFavoriteEvent({required this.restaurantDetails});
}

class GetRestaurantDetailsEvent extends RestaurantEvent {
  final String restaurantId;

  GetRestaurantDetailsEvent({required this.restaurantId});
}
