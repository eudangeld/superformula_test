import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/features/restaurants/data/data_sources/restaurants_remote_data_source.dart';
import 'package:restaurant_tour/features/restaurants/data/models/restaurant_model.dart';
import 'package:restaurant_tour/features/restaurants/data/repositories/restaurants_repository_impl.dart';

import '../../../../mocks/restaurant_faker.dart';

class RestaurantsRemoteDataSourceMock extends Mock
    implements RestaurantsRemoteDataSource {}

void main() {
  late final RestaurantsRepositoryImpl restaurantsRepositoryImpl;
  late final RestaurantsRemoteDataSourceMock restaurantsRemoteDataSourceMock;

  setUp(() {
    restaurantsRemoteDataSourceMock = RestaurantsRemoteDataSourceMock();
    restaurantsRepositoryImpl = RestaurantsRepositoryImpl(
      remoteDataSource: restaurantsRemoteDataSourceMock,
    );
  });
  test(
    'should return when the call to remote data source is ok',
    () async {
      final fakerModel = fakerRestaurantModel;
      final List<RestaurantModel> mockResponse = [fakerModel];
      when(restaurantsRemoteDataSourceMock.restaurantsList)
          .thenAnswer((_) async => mockResponse);

      final result = await restaurantsRepositoryImpl.restaurantsList();

      expect(result, isRight);
      expect(result, isRightOf(mockResponse));
    },
  );
}
