import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/shared_interfaces/usecase.dart';
import '../entities/restaurant.dart';
import '../repositories/favorites_repository.dart';

class ListFavoritesUsecase extends UseCase<List<Restaurant>, NoParams> {
  final FavoritesRepository favoritesRepository;

  ListFavoritesUsecase({
    required this.favoritesRepository,
  });

  @override
  Future<Either<Failure, List<Restaurant>>> call(NoParams params) async {
    return await favoritesRepository.list();
  }
}
