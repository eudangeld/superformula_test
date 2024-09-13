import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/restaurant.dart';
import '../../domain/repositories/restaurants_repository.dart';
import '../data_sources/restaurants_remote_data_source.dart';

class RestaurantsRepositoryImpl implements RestaurantsRepository {
  final RestaurantsRemoteDataSource remoteDataSource;

  RestaurantsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Restaurant>>> restaurantsList() async {
    try {
      final result = await remoteDataSource.restaurantsList();

      return Right(result);
    } on Exception catch (_) {
      return Left(ServerFailure());
    }
  }
}
