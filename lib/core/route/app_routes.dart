import 'package:flutter/material.dart';

import '../../features/restaurants/presentation/ui/pages/favorites_page.dart';
import '../../features/restaurants/presentation/ui/pages/restaurants_page.dart';

class AppRoutes {
  static const HOME = '/';
  static const RESTAURANT_DETAILS = '/restaurant_details';

  Map<String, WidgetBuilder> get routesBuilder => {
        HOME: ((context) => const RestaurantsPage()),
        RESTAURANT_DETAILS: ((context) => const FavoritePage()),
      };
}
