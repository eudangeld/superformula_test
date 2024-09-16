import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/core/error/failures.dart';
import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant_details.dart';

import '../../domain/entities/restaurant.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../data_sources/favorites_local_data_source.dart';
import '../models/restaurant_model.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource localFavoritesDataSource;

  FavoritesRepositoryImpl({required this.localFavoritesDataSource});

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Restaurant>>> list() {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RestaurantDetails>> save(
    RestaurantDetails restaurant,
  ) async {
    final model = RestaurantModel(
      address: restaurant.address,
      categories: restaurant.categories,
      id: restaurant.id,
      isCLosed: restaurant.isCLosed,
      name: restaurant.name,
      photos: restaurant.photos,
      price: restaurant.price,
      rating: restaurant.rating,
    );
    await localFavoritesDataSource.save(model);
    return Right(restaurant);
  }
}
