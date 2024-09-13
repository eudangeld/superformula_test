import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/core/error/failures.dart';
import 'package:restaurant_tour/core/shared_interfaces/usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant.dart';

import '../repositories/restaurants_repository.dart';

class GetRestaurantsListUsecase extends UseCase<List<Restaurant>, NoParams> {
  GetRestaurantsListUsecase({required this.restaurantsRepository});

  final RestaurantsRepository restaurantsRepository;

  @override
  Future<Either<Failure, List<Restaurant>>> call(NoParams params) async {
    final response = await restaurantsRepository.restaurantsList();
    return response;
  }
}
