import 'package:mockito/annotations.dart';
import 'package:restaurant_tour/features/restaurants/data/data_sources/restaurants_remote_data_source.dart';
import 'package:restaurant_tour/features/restaurants/domain/repositories/restaurants_repository.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<RestaurantsRepository>(as: #RestaurantsRepositoryMock),
    MockSpec<RestaurantsRemoteDataSource>(as: #RestaurantsRemoteDataSourceMock),
  ],
)
void main() {}
