import '../../domain/entities/restaurant.dart';

abstract class RestaurantState {}

class LoadedState extends RestaurantState {
  final List<Restaurant> restaurants;

  LoadedState({required this.restaurants});
}

class LoadingState extends RestaurantState {}

class EmptyState extends RestaurantState {}

class ErrorState extends RestaurantState {}
