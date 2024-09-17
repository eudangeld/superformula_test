import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/shared_interfaces/usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/usecases/delete_favorites_usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/usecases/get_restaurant_details_usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/usecases/get_restaurants_list_usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/usecases/list_favorites_usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/usecases/save_favorite_usecase.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_bloc.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_events.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_state.dart';

import '../../../../mocks/restaurant_faker.dart';

class MockGetRestaurantsListUseCase extends Mock
    implements GetRestaurantsListUsecase {}

class MockGetRestaurantsDetailsUseCase extends Mock
    implements GetRestaurantDetailsUsecase {}

class MockSaveFavoriteUsecase extends Mock implements SaveFavoriteUsecase {}

class MockListFavoritesUsecase extends Mock implements ListFavoritesUsecase {}

class MockDeleteFavoritesUsecase extends Mock
    implements DeleteFavoritesUsecase {}

void main() {
  late final RestaurantsBloc restaurantsBloc;
  late final MockGetRestaurantsListUseCase mockRestaurantsListUseCase;
  late final MockGetRestaurantsDetailsUseCase mockRestaurantsDetailsUseCase;
  late final MockSaveFavoriteUsecase mockSaveFavoriteUsecase;
  late final MockListFavoritesUsecase mockListFavoritesUsecase;
  late final MockDeleteFavoritesUsecase mockDeleteFavoritesUsecase;

  setUpAll(() {
    registerFallbackValue(NoParams());
    mockRestaurantsListUseCase = MockGetRestaurantsListUseCase();
    mockRestaurantsDetailsUseCase = MockGetRestaurantsDetailsUseCase();
    mockSaveFavoriteUsecase = MockSaveFavoriteUsecase();
    mockListFavoritesUsecase = MockListFavoritesUsecase();
    mockDeleteFavoritesUsecase = MockDeleteFavoritesUsecase();
    restaurantsBloc = RestaurantsBloc(
      getRestaurantsUseCase: mockRestaurantsListUseCase,
      getRestaurantDetailsUsecase: mockRestaurantsDetailsUseCase,
      saveFavoriteUsecase: mockSaveFavoriteUsecase,
      listFavoritesUsecase: mockListFavoritesUsecase,
      deleteFavoritesUsecase: mockDeleteFavoritesUsecase,
    );
    when(() => mockRestaurantsListUseCase.call(any())).thenAnswer(
      (realInvocation) async => Right(fakerListOfRestaurants),
    );
  });
  test('Starts with EmptyState', () {
    expect(restaurantsBloc.state, isA<EmptyState>());
  });
  blocTest(
    'Check state sequency with GetRestaurantsListEvent when Right Usecase returns OK',
    build: () => restaurantsBloc,
    act: (bloc) => bloc.add(GetRestaurantsListEvent()),
    expect: () => [isA<LoadingState>(), isA<RestaurantListLoaded>()],
  );
}
