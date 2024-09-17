import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/shared_interfaces/usecase.dart';
import '../entities/restaurant_details.dart';
import '../repositories/favorites_repository.dart';

class DeleteFavoritesUsecase
    extends UseCase<RestaurantDetails, RestaurantDetails> {
  final FavoritesRepository favoritesRepository;

  DeleteFavoritesUsecase({
    required this.favoritesRepository,
  });

  @override
  Future<Either<Failure, RestaurantDetails>> call(
    // ignore: avoid_renaming_method_parameters
    RestaurantDetails restaurantDetails,
  ) async {
    final response = await favoritesRepository.delete(restaurantDetails.id);
    return response.fold(
      (l) => Left(LocalStorageFailure()),
      (r) => Right(restaurantDetails..isFavorite = false),
    );
  }
}
