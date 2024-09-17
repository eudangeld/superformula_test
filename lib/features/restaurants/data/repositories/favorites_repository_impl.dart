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
  Future<Either<bool, bool>> delete(String id) async {
    try {
      await localFavoritesDataSource.delete(id);
      return const Right(true);
    } catch (e) {
      return const Left(false);
    }
  }

  @override
  Future<Either<Failure, List<Restaurant>>> list() async {
    try {
      final response = await localFavoritesDataSource.list();
      return Right(response);
    } catch (e) {
      return Left(LocalStorageFailure());
    }
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

  @override
  Future<Either<Failure, bool>> exist(String id) async {
    try {
      final result = await localFavoritesDataSource.exist(id);
      return Right(result);
    } catch (e) {
      return Left(LocalStorageFailure());
    }
  }
}
