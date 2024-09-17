import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/features/restaurants/domain/repositories/favorites_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/shared_interfaces/usecase.dart';
import '../entities/restaurant_details.dart';
import '../repositories/restaurants_repository.dart';

class GetRestaurantDetailsUsecase extends UseCase<RestaurantDetails, String> {
  final RestaurantsRepository restaurantsRepository;
  final FavoritesRepository favoritesRepository;

  GetRestaurantDetailsUsecase({
    required this.restaurantsRepository,
    required this.favoritesRepository,
  });

  @override

  // ignore: avoid_renaming_method_parameters
  Future<Either<Failure, RestaurantDetails>> call(String restaurantId) async {
    final result = await restaurantsRepository.restaurantDetails(restaurantId);
    final isFavoriteEitherResult =
        await favoritesRepository.exist(restaurantId);
    bool isFavorite = false;

    isFavoriteEitherResult.fold(
      (ifLeft) => isFavorite = false,
      (ifRight) => isFavorite = ifRight,
    );

    return result.fold(
      (ifLeft) => Left(ServerFailure()),
      (ifRight) => Right(ifRight..isFavorite = isFavorite),
    );
  }
}
