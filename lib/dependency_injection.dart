import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'features/restaurants/data/data_sources/restaurant_remote_data_source_implementation.dart';
import 'features/restaurants/data/data_sources/restaurants_remote_data_source.dart';
import 'features/restaurants/data/repositories/restaurants_repository_impl.dart';
import 'features/restaurants/domain/repositories/restaurants_repository.dart';
import 'features/restaurants/domain/usecases/get_restaurants_list_usecase.dart';
import 'features/restaurants/presentation/bloc/restaurants_bloc.dart';

final serviceLocator = GetIt.instance;

void injectDependencies() {
  final graphqlUrl = dotenv.get('GRAPHQL_API_URL');
  final apiKey = dotenv.get('API_KEY');

  final graphqlLink = HttpLink(
    graphqlUrl,
    defaultHeaders: {'Authorization': 'Bearer $apiKey'},
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
