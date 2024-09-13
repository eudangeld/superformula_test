import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/restaurant_model.dart';
import 'restaurants_remote_data_source.dart';

class RestaurantsRemoteSourceImplementation
    implements RestaurantsRemoteDataSource {
  final GraphQLClient graphQlClient;

  RestaurantsRemoteSourceImplementation({required this.graphQlClient});

  @override
  Future<List<RestaurantModel>> restaurantsList() async {
    final QueryResult result =
        await graphQlClient.query(restaurantsQueryOption);
    print(result);

    return [];
  }
}

final restaurantsQueryOption =
    QueryOptions(document: gql(_restaurantListQuery));
const String _restaurantListQuery = '''
  query Restaurants {
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
}
  ''';
