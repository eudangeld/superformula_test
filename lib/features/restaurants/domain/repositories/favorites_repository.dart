import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/restaurant.dart';
import '../entities/restaurant_details.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<Restaurant>>> list();
  Future<Either<Failure, RestaurantDetails>> save(RestaurantDetails restaurant);
  Future<void> delete(String id);
}
