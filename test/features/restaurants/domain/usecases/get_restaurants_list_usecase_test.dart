import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/shared_interfaces/usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/features/restaurants/domain/usecases/get_restaurants_list_usecase.dart';

import '../../../../mocks/restaurant_faker.dart';

class RestaurantsRepositoryMock extends Mock implements RestaurantsRepository {}

void main() {
  late GetRestaurantsListUsecase useCase;
  late RestaurantsRepositoryMock restaurantsRepoMock;

  setUp(() {
    restaurantsRepoMock = RestaurantsRepositoryMock();
    useCase =
        GetRestaurantsListUsecase(restaurantsRepository: restaurantsRepoMock);
  });

  test('Should return a list of restaurants', () async {
    final repoResult = fakerListOfRestaurants;
    when(restaurantsRepoMock.restaurantsList)
        .thenAnswer((_) async => Right(fakerListOfRestaurants));

    final result = await useCase(NoParams());

    expect(result, isRight);
    expect(result, isRightOf(repoResult));

    verifyNoMoreInteractions(restaurantsRepoMock);
  });
}
