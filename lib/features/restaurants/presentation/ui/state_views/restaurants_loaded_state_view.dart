import 'package:flutter/material.dart';

import '../../../domain/entities/restaurant.dart';
import '../widgets/restaurant_tile_widget.dart';

class LoadedStateView extends StatelessWidget {
  final List<Restaurant> restaurants;

  const LoadedStateView(this.restaurants, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemCount: restaurants.length,
        itemBuilder: (_, index) => RestaurantTileWidget(restaurants[index]),
      ),
    );
  }
}
