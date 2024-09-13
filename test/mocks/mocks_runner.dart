import 'package:mockito/annotations.dart';
import 'package:restaurant_tour/features/restaurants/domain/repositories/restaurants_repository.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<RestaurantsRepository>(as: #RestaurantsRepositoryMock),
  ],
)
void main() {}
