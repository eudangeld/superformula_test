import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant_details.dart';

import '../../domain/entities/restaurant.dart';

abstract class RestaurantState {}

class RestaurantDetailsLoaded extends RestaurantState {
  final RestaurantDetails restaurantDetails;

  RestaurantDetailsLoaded({required this.restaurantDetails});
}

class RestaurantListLoaded extends RestaurantState {
  final List<Restaurant> restaurants;

  RestaurantListLoaded({required this.restaurants});
}

class FavoriteListLoaded extends RestaurantState {
  final List<Restaurant> restaurants;

  FavoriteListLoaded({required this.restaurants});
}

class LoadingState extends RestaurantState {}

class EmptyState extends RestaurantState {}

class ErrorState extends RestaurantState {}
