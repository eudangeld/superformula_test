import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_interfaces/usecase.dart';
import '../../domain/usecases/delete_favorites_usecase.dart';
import '../../domain/usecases/get_restaurant_details_usecase.dart';
import '../../domain/usecases/get_restaurants_list_usecase.dart';
import '../../domain/usecases/list_favorites_usecase.dart';
import '../../domain/usecases/save_favorite_usecase.dart';
import 'restaurants_events.dart';
import 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final GetRestaurantsListUsecase getRestaurantsUseCase;
  final GetRestaurantDetailsUsecase getRestaurantDetailsUsecase;
  final SaveFavoriteUsecase saveFavoriteUsecase;
  final ListFavoritesUsecase listFavoritesUsecase;
  final DeleteFavoritesUsecase deleteFavoritesUsecase;

  RestaurantsBloc({
    required this.getRestaurantsUseCase,
    required this.getRestaurantDetailsUsecase,
    required this.saveFavoriteUsecase,
    required this.listFavoritesUsecase,
    required this.deleteFavoritesUsecase,
  }) : super(EmptyState()) {
    on<GetRestaurantsListEvent>(_getRestaurantsListEventHandler);
    on<GetRestaurantDetailsEvent>(_getRestaurantDetailsEventHandler);
    on<SaveFavoriteEvent>(_saveFavoriteEventHandler);
    on<GetFavoriteListEvent>(_getFavoriteListEventHandler);
    on<DeleteFavoriteEvent>(_deleteFavoriteEventHandler);
  }

  _deleteFavoriteEventHandler(
    DeleteFavoriteEvent event,
    emit,
  ) async {
    emit(LoadingState());
    final response = await deleteFavoritesUsecase(event.restaurantDetails);
    response.fold(
      (l) => emit(
          RestaurantDetailsLoaded(restaurantDetails: event.restaurantDetails)),
      (r) => emit(RestaurantDetailsLoaded(restaurantDetails: r)),
    );
  }

  _getFavoriteListEventHandler(
    GetFavoriteListEvent event,
    emit,
  ) async {
    emit(LoadingState());
    final response = await listFavoritesUsecase(NoParams());

    response.fold(
      (l) => emit(ErrorState()),
      (r) => emit(FavoriteListLoaded(restaurants: r)),
    );
  }

  _saveFavoriteEventHandler(
    SaveFavoriteEvent event,
    emit,
  ) async {
    emit(LoadingState());
    final response = await saveFavoriteUsecase(event.restaurantDetails);
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
