import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/restaurants/presentation/ui/pages/restaurants_page.dart';

class AppRoutes {
  static const HOME = '/';
  static const RESTAURANT_DETAILS = '/restaurant_details';

  Map<String, WidgetBuilder> get routesBuilder => {
        HOME: ((context) => const RestaurantsPage()),
      };
}
