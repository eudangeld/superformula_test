import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/restaurants_bloc.dart';
import '../../bloc/restaurants_events.dart';
import '../../bloc/restaurants_state.dart';
import '../state_views/restaurant_details_state_view.dart';
import '../state_views/restaurants_loading_state_view.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key});

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantStateDetailsPage();
}

class _RestaurantStateDetailsPage extends State<RestaurantDetailsPage> {
  String appBarTitle = '';
  _handleBackButton(context) {
    BlocProvider.of<RestaurantsBloc>(context).add(GetRestaurantsListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) async {
        _handleBackButton(context);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<RestaurantsBloc, RestaurantState>(
          builder: (_, state) {
            return switch (state) {
              LoadingState() => const LoadingStateView(),
              RestaurantDetailsLoaded() => RestaurantDetailsStateView(
                  state.restaurantDetails,
                ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
