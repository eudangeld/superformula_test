import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/shared_interfaces/usecase.dart';
import '../entities/restaurant_details.dart';
import '../repositories/restaurants_repository.dart';

class GetRestaurantDetailsUsecase extends UseCase<RestaurantDetails, String> {
  final RestaurantsRepository restaurantsRepository;

  GetRestaurantDetailsUsecase({required this.restaurantsRepository});

  @override

  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, RestaurantDetails>> call(String restaurantId) async {
    final result = await restaurantsRepository.restaurantDetails(restaurantId);
    return result;
  }
}
