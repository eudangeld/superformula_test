import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_bloc.dart';

import 'features/restaurants/data/data_sources/restaurant_remote_data_source_implementation.dart';
import 'features/restaurants/data/data_sources/restaurants_remote_data_source.dart';
import 'features/restaurants/data/repositories/restaurants_repository_impl.dart';
import 'features/restaurants/domain/repositories/restaurants_repository.dart';
import 'features/restaurants/domain/usecases/get_restaurants_list_usecase.dart';

final serviceLocator = GetIt.instance;

void injectDependencies() {
  final HttpLink graphqlLink = HttpLink(
    'https://api.github.com/graphql',
  );

  final GraphQLClient graphQLClient =
      GraphQLClient(link: graphqlLink, cache: GraphQLCache());

  serviceLocator.registerLazySingleton<RestaurantsRemoteDataSource>(() =>
      RestaurantsRemoteSourceImplementation(graphQlClient: graphQLClient));
  serviceLocator.registerLazySingleton<RestaurantsRepository>(
      () => RestaurantsRepositoryImpl(remoteDataSource: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => GetRestaurantsListUsecase(restaurantsRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => RestaurantsBloc(getRestaurantsUseCase: serviceLocator()));
}
