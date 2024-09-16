import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/features/restaurants/data/models/restaurant_model.dart';
import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant.dart';

import '../../../../fixtures/json_reader.dart';

void main() {
  /// expected model reading from fixture json
  const testRestaurantModel = RestaurantModel(
    id: "vHz2RLtfUMVRPFmd7VBEHA",
    name: "Gordon Ramsay Hell's Kitchen",
    categories: [],
    price: "\$\$\$",
    photos: [
      "https://s3-media2.fl.yelpcdn.com/bphoto/q771KjLzI5y638leJsnJnQ/o.jpg",
    ],
    rating: 4.4,
    isCLosed: false,
    address: "3570 Las Vegas Blvd S",
  );

  test(
    'should return a valid model',
    () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('restaurants_list.json'));

      final result =
          RestaurantModel.fromJson(jsonMap['data']['search']['business'][0]);

      expect(result, testRestaurantModel);
      expect(result, isA<Restaurant>());
    },
  );
  test(
    'should return a json Map from a model',
    () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('restaurants_list.json'));

      final resutaurantModel =
          RestaurantModel.fromJson(jsonMap['data']['search']['business'][0]);

      final result = resutaurantModel.toJson();

      expect(result, jsonMap['data']['search']['business'][0]);
    },
  );
}
