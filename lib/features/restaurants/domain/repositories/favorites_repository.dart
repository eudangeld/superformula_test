import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/restaurant.dart';
import '../entities/restaurant_details.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<Restaurant>>> list();
  Future<Either<Failure, RestaurantDetails>> save(RestaurantDetails restaurant);
  Future<Either<bool, bool>> delete(String id);
  Future<Either<Failure, bool>> exist(String id);
}
