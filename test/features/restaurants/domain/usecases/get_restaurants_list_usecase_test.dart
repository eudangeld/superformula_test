import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/core/shared_interfaces/usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/usecases/get_restaurants_list_usecase.dart';

import '../../../../mocks/mocks_runner.mocks.dart';

void main() {
  late GetRestaurantsListUsecase useCase;
  late RestaurantsRepositoryMock restaurantsRepoMock;

  setUp(() {
    restaurantsRepoMock = RestaurantsRepositoryMock();
    useCase =
        GetRestaurantsListUsecase(restaurantsRepository: restaurantsRepoMock);
  });

  test('Should return a list of restaurants', () async {
    when(restaurantsRepoMock.restaurantsList())
        .thenAnswer((_) => Future.value(const Right([])));
    final result = await useCase(NoParams());
    expect(result, isRight);
  });
}
