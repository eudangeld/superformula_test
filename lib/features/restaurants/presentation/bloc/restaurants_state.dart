import '../../domain/entities/restaurant.dart';

abstract class RestaurantState {}

class RestaurantListLoaded extends RestaurantState {
  final List<Restaurant> restaurants;

  RestaurantListLoaded({required this.restaurants});
}

class LoadingState extends RestaurantState {}

class EmptyState extends RestaurantState {}

class ErrorState extends RestaurantState {}
