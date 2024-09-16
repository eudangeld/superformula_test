import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant.dart';

class RestaurantTileWidget extends StatelessWidget {
  final Restaurant restaurantEntitie;

  const RestaurantTileWidget(this.restaurantEntitie, {super.key, required});

  @override
  Widget build(BuildContext context) {
    const double aspect = 100;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Image.network(
            restaurantEntitie.photos.first,
            height: aspect,
            width: aspect,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
        Column(
          children: [
            Text(restaurantEntitie.name),
            Text(restaurantEntitie.price),
          ],
        )
      ],
    );
  }
}
