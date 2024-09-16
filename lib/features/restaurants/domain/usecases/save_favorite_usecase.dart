import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/core/error/failures.dart';
import 'package:restaurant_tour/core/shared_interfaces/usecase.dart';
import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant_details.dart';

import '../repositories/favorites_repository.dart';

class SaveFavoriteUsecase
    extends UseCase<RestaurantDetails, RestaurantDetails> {
  final FavoritesRepository favoritesRepository;

  SaveFavoriteUsecase({
    required this.favoritesRepository,
  });

  @override
  Future<Either<Failure, RestaurantDetails>> call(
    // ignore: avoid_renaming_method_parameters
    RestaurantDetails restaurant,
  ) async {
    return await favoritesRepository.save(restaurant);
  }
}
