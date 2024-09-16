import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/restaurant_details_model.dart';
import '../models/restaurant_model.dart';
import 'queries/restaurant_queries.dart';
import 'restaurants_remote_data_source.dart';

class RestaurantsRemoteSourceImplementation
    implements RestaurantsRemoteDataSource {
  final GraphQLClient graphQlClient;

  RestaurantsRemoteSourceImplementation({required this.graphQlClient});

  @override
  Future<List<RestaurantModel>> restaurantsList() async {
    try {
      final QueryResult query = await graphQlClient
          .query(QueryOptions(document: gql(restaurantListQuery)));

      final List result = query.data?['search']?['business'] ?? [];
      final response = result
          .map<RestaurantModel>(
              (restaurant) => RestaurantModel.fromJson(restaurant))
          .toList();

      debugPrint('Fetched ${response.length} restaurants');

      return response;
    } catch (e) {
      debugPrint(
          'ERROR: RestaurantsRemoteSourceImplementation -> restaurantsList${e.toString()}');
      throw const ServerException();
    }
  }

  @override
  Future<RestaurantDetailsModel> restaurantDetails(String restaurantId) async {
    try {
      final QueryResult query = await graphQlClient.query(
        QueryOptions(
          variables: {"id": restaurantId},
          document: gql(restaurantDetailsQuery),
        ),
      );

      final result = query.data?['business'] ?? {};

      final response = RestaurantDetailsModel.fromJson(result);

      debugPrint('Fetched restaurantID: $restaurantId');

      return response;
    } catch (e) {
      debugPrint(
          'ERROR: RestaurantsRemoteSourceImplementation -> restaurantDetails ${e.toString()}');
      throw const ServerException();
    }
  }
}
