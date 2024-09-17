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

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  _onTabValueChange(value) {
    if (value == 0) {
      BlocProvider.of<RestaurantsBloc>(context).add(GetRestaurantsListEvent());
    }
    if (value == 1) {
      BlocProvider.of<RestaurantsBloc>(context).add(GetFavoriteListEvent());
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            EnRestaurantsStrings.appName,
            style: AppTextStyles.loraRegularHeadline,
          ),
          bottom: TabBar(
            controller: tabController,
            onTap: _onTabValueChange,
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
          create: (context) =>
              serviceLocator<RestaurantsBloc>()..add(GetRestaurantsListEvent()),
          child: BlocConsumer<RestaurantsBloc, RestaurantState>(
            builder: (BuildContext context, state) {
              return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  // list tab state handler
                  switch (state) {
                    EmptyState() => const LoadingStateView(),
                    LoadingState() => const LoadingStateView(),
                    RestaurantListLoaded() =>
                      LoadedStateView(state.restaurants),
                    ErrorState() => const ErrorStateView(),
                    _ => const SizedBox.shrink(),
                  },
                  // preferences tab state handler
                  switch (state) {
                    EmptyState() => const LoadingStateView(),
                    LoadingState() => const LoadingStateView(),
                    FavoriteListLoaded() => LoadedStateView(state.restaurants),
                    ErrorState() => const ErrorStateView(),
                    _ => const SizedBox.shrink(),
                  }
                ],
              );
            },
            listener: (BuildContext context, RestaurantState state) {
              if (state is RestaurantDetailsLoaded) {
                tabController.animateTo(0, duration: Duration.zero);
              }
            },
          ),
        ));
  }
}
