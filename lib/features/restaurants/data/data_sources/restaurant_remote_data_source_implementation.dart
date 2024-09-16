import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
      debugPrint('RestaurantsRemoteSourceImplementation ${e.toString()}');
      throw const ServerException();
    }
  }

  @override
  Future<List<RestaurantModel>> restaurantDetails() {
    // TODO: implement restaurantDetails
    throw UnimplementedError();
  }
}
