import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/shared_interfaces/usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/usecases/get_restaurants_list_usecase.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_events.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final GetRestaurantsListUsecase getRestaurantsUseCase;

  RestaurantsBloc({required this.getRestaurantsUseCase}) : super(EmptyState()) {
    on<GetRestaurantsListEvent>(_getRestaurantsListEventHandler);
  }

  _getRestaurantsListEventHandler(GetRestaurantsListEvent event, emit) async {
    emit(LoadingState());
    final restaurants = await getRestaurantsUseCase(NoParams());
    restaurants.fold(
      (l) => emit(ErrorState()),
      (r) => emit(LoadedState(restaurants: r)),
    );
  }
}
