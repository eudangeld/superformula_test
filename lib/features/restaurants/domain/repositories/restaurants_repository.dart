import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/restaurant.dart';
import '../entities/restaurant_details.dart';

abstract class RestaurantsRepository {
  Future<Either<Failure, List<Restaurant>>> restaurantsList();
  Future<Either<Failure, RestaurantDetails>> restaurantDetails(
    String restaurantId,
  );
}
