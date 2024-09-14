import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './dependency_injection.dart' as di;
import 'dependency_injection.dart';
import 'features/restaurants/presentation/bloc/restaurants_bloc.dart';
import 'features/restaurants/presentation/pages/restaurants_page.dart';

main() async {
  di.injectDependencies();
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<RestaurantsBloc>()),
      ],
      child: const MaterialApp(
        title: 'Restaurant Tour',
        home: RestaurantsPage(),
      ),
    );
  }
}
