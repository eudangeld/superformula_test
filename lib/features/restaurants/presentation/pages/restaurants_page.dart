import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection.dart';
import '../bloc/restaurants_bloc.dart';
import '../bloc/restaurants_events.dart';
import '../bloc/restaurants_state.dart';
import 'state_views/restaurants_error_state_view.dart';
import 'state_views/restaurants_loaded_state_view.dart';
import 'state_views/restaurants_loading_state_view.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          serviceLocator<RestaurantsBloc>()..add(GetRestaurantsListEvent()),
      child: BlocBuilder<RestaurantsBloc, RestaurantState>(
        builder: (BuildContext context, state) {
          return switch (state) {
            EmptyState() => const LoadingStateView(),
            LoadingState() => const LoadingStateView(),
            LoadedState() => const LoadedStateView(),
            ErrorState() => const ErrorStateView(),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    ));
  }
}
