import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant_details.dart';
import 'package:restaurant_tour/typography.dart';

import '../../bloc/restaurants_bloc.dart';
import '../../bloc/restaurants_events.dart';
import '../../bloc/restaurants_state.dart';
import '../state_views/restaurant_details_state_view.dart';
import '../state_views/restaurants_loading_state_view.dart';
import '../widgets/favorite_button_widget.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({super.key});

  _handleBackButton(context) =>
      BlocProvider.of<RestaurantsBloc>(context).add(GetRestaurantsListEvent());

  _favoriteHandler(context, RestaurantDetails restaurantDetails) {
    if (restaurantDetails.isFavorite ?? false) {
      BlocProvider.of<RestaurantsBloc>(context)
          .add(DeleteFavoriteEvent(restaurantDetails: restaurantDetails));
      return;
    }
    BlocProvider.of<RestaurantsBloc>(context)
        .add(SaveFavoriteEvent(restaurantDetails: restaurantDetails));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (_) async => _handleBackButton(context),
      child: BlocBuilder<RestaurantsBloc, RestaurantState>(
        builder: (_, state) {
          return switch (state) {
            LoadingState() =>
              Scaffold(body: const LoadingStateView(), appBar: AppBar()),
            RestaurantDetailsLoaded() => Scaffold(
                appBar: AppBar(
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () =>
                            _favoriteHandler(context, state.restaurantDetails),
                        child: FavoriteButton(
                          value: state.restaurantDetails.isFavorite ?? false,
                        ),
                      ),
                    )
                  ],
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
