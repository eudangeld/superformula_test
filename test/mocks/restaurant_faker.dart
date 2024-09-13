import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant.dart';
import 'package:faker/faker.dart';

List<Restaurant> get fakerListOfRestaurants =>
    List.generate(20, (_) => fakerSingleRestaurant);

Restaurant get fakerSingleRestaurant => Restaurant(
      name: faker.company.name(),
      price: List.generate(random.integer(4), (_) => '\$').join(),
      photos: [faker.image.loremPicsum()],
      rating: random.decimal(min: 1, scale: 5),
      isCLosed: random.boolean(),
      address: faker.address.streetName(),
    );
