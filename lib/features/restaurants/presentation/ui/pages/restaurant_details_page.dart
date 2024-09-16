import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/typography.dart';

import '../../bloc/restaurants_bloc.dart';
import '../../bloc/restaurants_events.dart';
import '../../bloc/restaurants_state.dart';
import '../state_views/restaurant_details_state_view.dart';
import '../state_views/restaurants_loading_state_view.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({super.key});

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
      child: BlocBuilder<RestaurantsBloc, RestaurantState>(
        builder: (_, state) {
          return switch (state) {
            LoadingState() =>
              Scaffold(body: const LoadingStateView(), appBar: AppBar()),
            RestaurantDetailsLoaded() => Scaffold(
                appBar: AppBar(
                  title: Text(
                    state.restaurantDetails.name,
                    style: AppTextStyles.loraRegularHeadline,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                body: RestaurantDetailsStateView(
                  state.restaurantDetails,
                ),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
