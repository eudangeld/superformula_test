import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_interfaces/usecase.dart';
import '../../domain/usecases/get_restaurant_details_usecase.dart';
import '../../domain/usecases/get_restaurants_list_usecase.dart';
import '../../domain/usecases/save_favorite_usecase.dart';
import 'restaurants_events.dart';
import 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final GetRestaurantsListUsecase getRestaurantsUseCase;
  final GetRestaurantDetailsUsecase getRestaurantDetailsUsecase;
  final SaveFavoriteUsecase saveFavoriteUsecase;

  RestaurantsBloc({
    required this.getRestaurantsUseCase,
    required this.getRestaurantDetailsUsecase,
    required this.saveFavoriteUsecase,
  }) : super(EmptyState()) {
    on<GetRestaurantsListEvent>(_getRestaurantsListEventHandler);
    on<GetRestaurantDetailsEvent>(_getRestaurantDetailsEventHandler);
    on<SaveFavoriteEvent>(_saveFavoriteEventHandler);
  }

  _saveFavoriteEventHandler(
    SaveFavoriteEvent event,
    emit,
  ) async {
    emit(LoadingState());
    final response = await saveFavoriteUsecase(event.restaurant);
    response.fold(
      (l) => emit(ErrorState()),
      (r) => emit(RestaurantDetailsLoaded(restaurantDetails: r)),
    );
  }

  _getRestaurantDetailsEventHandler(
    GetRestaurantDetailsEvent event,
    emit,
  ) async {
    emit(LoadingState());
    final restaurantDetails =
        await getRestaurantDetailsUsecase(event.restaurantId);
    restaurantDetails.fold(
      (l) => emit(ErrorState()),
      (r) => emit(RestaurantDetailsLoaded(restaurantDetails: r)),
    );
  }

  _getRestaurantsListEventHandler(
    GetRestaurantsListEvent event,
    emit,
  ) async {
    emit(LoadingState());
    final restaurants = await getRestaurantsUseCase(NoParams());
    restaurants.fold(
      (l) => emit(ErrorState()),
      (r) => emit(RestaurantListLoaded(restaurants: r)),
    );
  }
}
