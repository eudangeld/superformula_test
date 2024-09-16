import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../dependency_injection.dart';
import '../../../../../typography.dart';
import '../../bloc/restaurants_bloc.dart';
import '../../bloc/restaurants_events.dart';
import '../../bloc/restaurants_state.dart';
import '../state_views/restaurants_error_state_view.dart';
import '../state_views/restaurants_loaded_state_view.dart';
import '../state_views/restaurants_loading_state_view.dart';
import '../strings/en_strings.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              EnRestaurantsStrings.appName,
              style: AppTextStyles.loraRegularHeadline,
            ),
            bottom: TabBar(
              labelStyle: AppTextStyles.openRegularTitleSemiBold,
              tabs: [
                Tab(
                  text: EnRestaurantsStrings.allRestaurantsTabTitle,
                ),
                Tab(text: EnRestaurantsStrings.favoritesTabTitle),
              ],
            ),
          ),
          body: BlocProvider(
            create: (context) => serviceLocator<RestaurantsBloc>()
              ..add(GetRestaurantsListEvent()),
            child: BlocBuilder<RestaurantsBloc, RestaurantState>(
              builder: (BuildContext context, state) {
                return TabBarView(
                  children: [
                    // list tab state handler
                    switch (state) {
                      EmptyState() => const LoadingStateView(),
                      LoadingState() => const LoadingStateView(),
                      LoadedState() => LoadedStateView(state),
                      ErrorState() => const ErrorStateView(),
                      _ => const SizedBox.shrink(),
                    },
                    // preferences tab state handler
                    switch (state) {
                      EmptyState() => const LoadingStateView(),
                      LoadingState() => const LoadingStateView(),
                      LoadedState() => LoadedStateView(state),
                      ErrorState() => const ErrorStateView(),
                      _ => const SizedBox.shrink(),
                    }
                  ],
                );
              },
            ),
          )),
    );
  }
}
