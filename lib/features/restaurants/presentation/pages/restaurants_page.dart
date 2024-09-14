import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/dependency_injection.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_bloc.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_events.dart';
import 'package:restaurant_tour/features/restaurants/presentation/bloc/restaurants_state.dart';

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
            ErrorState() => const ErrorState(),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    ));
  }
}

class LoadedStateView extends StatelessWidget {
  const LoadedStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Loaded'),
    );
  }
}

class LoadingStateView extends StatelessWidget {
  const LoadingStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ErrorState extends StatelessWidget {
  const ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
