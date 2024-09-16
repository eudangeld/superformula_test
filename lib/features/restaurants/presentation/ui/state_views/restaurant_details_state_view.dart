import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../typography.dart';
import '../../../domain/entities/restaurant_details.dart';
import '../strings/en_strings.dart';
import '../widgets/network_image_loader.dart';
import '../widgets/open_closed_indicator_widget.dart';

class RestaurantDetailsStateView extends StatelessWidget {
  const RestaurantDetailsStateView(
    this.restaurantDetails, {
    super.key,
  });

  final RestaurantDetails restaurantDetails;

  @override
  Widget build(BuildContext context) {
    const divider = Divider(height: .1);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NetworkImageLoader(
            boxFit: BoxFit.cover,
            url: restaurantDetails.photos.first,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    restaurantDetails.price,
                    style: AppTextStyles.openRegularText,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    restaurantDetails.categories.first,
                    style: AppTextStyles.openRegularText,
                  ),
                ],
              ),
              OpenClosedIndicatorWidget(
                value: restaurantDetails.isCLosed,
              ),
            ],
          ),
          divider,
          Text(
            EnRestaurantsStrings.address,
            style: AppTextStyles.openRegularText,
          ),
          Text(
            restaurantDetails.address,
            style: AppTextStyles.openRegularTitleSemiBold,
          ),
          Text(
            '${restaurantDetails.city}, ${restaurantDetails.state} ${restaurantDetails.postalCode}',
            style: AppTextStyles.openRegularTitleSemiBold,
          ),
          divider,
          Text(
            EnRestaurantsStrings.overallRating,
            style: AppTextStyles.openRegularText,
          ),
          Row(
            children: [
              Text(
                restaurantDetails.rating.toString(),
                style: AppTextStyles.loraRegularHeadline.copyWith(fontSize: 28),
              ),
              SvgPicture.asset('assets/vectors/rating_star.svg')
            ],
          ),
          divider,
          Text(
            '${restaurantDetails.reviews.length.toString()} ${EnRestaurantsStrings.reviews}',
            style: AppTextStyles.openRegularText,
          ),
        ],
      ),
    );
  }
}
