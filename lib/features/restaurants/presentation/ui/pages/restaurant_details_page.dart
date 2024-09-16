import 'package:flutter/material.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key});

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantStateDetailsPage();
}

class _RestaurantStateDetailsPage extends State<RestaurantDetailsPage> {
  String appBarTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
