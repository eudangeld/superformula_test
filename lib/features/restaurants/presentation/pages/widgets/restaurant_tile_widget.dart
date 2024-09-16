import 'package:flutter/material.dart';
import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant.dart';
import 'package:restaurant_tour/features/restaurants/presentation/pages/widgets/open_closed_indicator_widget.dart';
import 'package:restaurant_tour/features/restaurants/presentation/pages/widgets/rating_stars.dart';

import '../../../../../typography.dart';

class RestaurantTileWidget extends StatelessWidget {
  final Restaurant restaurantEntitie;

  const RestaurantTileWidget(this.restaurantEntitie, {super.key, required});

  @override
  Widget build(BuildContext context) {
    const double aspect = 100;
    final size = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                restaurantEntitie.photos.first,
                height: aspect,
                width: aspect,
                fit: BoxFit.cover,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
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
          ),
          SizedBox(
            height: size.height * .14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    width: size.width * .55,
                    child: Text(
                      restaurantEntitie.name,
                      style: AppTextStyles.loraRegularTitle,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * .55,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  restaurantEntitie.price,
                                  style: AppTextStyles.openRegularText,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  restaurantEntitie.categories.first,
                                  style: AppTextStyles.openRegularText,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            RatingStarsWidget(
                              value: restaurantEntitie.rating,
                            )
                          ],
                        ),
                        OpenClosedIndicatorWidget(
                          value: restaurantEntitie.isCLosed,
                        )
                        // Text('JOSE')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

final boxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 2,
    blurRadius: 3,
    offset: const Offset(5, 5), // changes position of shadow
  ),
];
