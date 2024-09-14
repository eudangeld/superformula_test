import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_state.dart';

import '../widgets/restaurant_tile_widget.dart';

class LoadedStateView extends StatelessWidget {
  final LoadedState state;

  const LoadedStateView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.restaurants.length,
        itemBuilder: (_, index) =>
            RestaurantTileWidget(state.restaurants[index]));
  }
}
