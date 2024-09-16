import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './dependency_injection.dart' as di;
import 'core/route/app_routes.dart';
import 'dependency_injection.dart';
import 'features/restaurants/presentation/bloc/restaurants_bloc.dart';

main() async {
  await dotenv.load(fileName: "assets/.env");
  await di.injectDependencies();
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});
  // final routes = AppRoutes().routesBuilder;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<RestaurantsBloc>()),
      ],
      child: MaterialApp(
        title: 'Restaurant Tour',
        routes: AppRoutes().routesBuilder,
      ),
    );
  }
}
