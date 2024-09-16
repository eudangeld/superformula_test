abstract class RestaurantEvent {}

class GetRestaurantsListEvent extends RestaurantEvent {}

class GetRestaurantDetailsEvent extends RestaurantEvent {
  final String restaurantId;

  GetRestaurantDetailsEvent({required this.restaurantId});
}
