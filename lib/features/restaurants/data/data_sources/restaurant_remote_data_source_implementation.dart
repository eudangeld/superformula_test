import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/restaurant_model.dart';
import 'restaurants_remote_data_source.dart';

class RestaurantsRemoteSourceImplementation
    implements RestaurantsRemoteDataSource {
  final GraphQLClient graphQlClient;

  RestaurantsRemoteSourceImplementation({required this.graphQlClient});

  @override
  Future<List<RestaurantModel>> restaurantsList() async {
    try {
      final QueryResult query =
          await graphQlClient.query(restaurantsQueryOption);

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
}

final restaurantsQueryOption =
    QueryOptions(document: gql(_restaurantListQuery));
const String _restaurantListQuery = '''
  query {
  search(location: "Las Vegas") {
    business {
      name
      price
      photos
      rating

      is_closed
      location {
        address1
      }
    }
  }
}''';
