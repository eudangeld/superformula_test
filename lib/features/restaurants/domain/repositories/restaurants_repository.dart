import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant.dart';

import '../../../../core/error/failures.dart';

abstract class RestaurantsRepository {
  Future<Either<Failure, List<Restaurant>>> restaurantsList();
}
