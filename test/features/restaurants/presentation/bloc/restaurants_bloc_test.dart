import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/shared_interfaces/usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/usecases/get_restaurants_list_usecase.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_bloc.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_events.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_state.dart';

import '../../../../mocks/restaurant_faker.dart';

class MockGetRestaurantsListUseCase extends Mock
    implements GetRestaurantsListUsecase {}

void main() {
  late final RestaurantsBloc restaurantsBloc;
  late final MockGetRestaurantsListUseCase mockRestaurantsListUseCase;

  setUpAll(() {
    registerFallbackValue(NoParams());
    mockRestaurantsListUseCase = MockGetRestaurantsListUseCase();
    restaurantsBloc =
        RestaurantsBloc(getRestaurantsUseCase: mockRestaurantsListUseCase);
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
      expect: () => [isA<LoadingState>(), isA<LoadedState>()]);
}
