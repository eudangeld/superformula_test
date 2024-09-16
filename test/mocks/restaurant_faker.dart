import 'package:restaurant_tour/features/restaurants/data/models/restaurant_model.dart';
import 'package:restaurant_tour/features/restaurants/domain/entities/restaurant.dart';
import 'package:faker/faker.dart';

List<Restaurant> get fakerListOfRestaurants =>
    List.generate(20, (_) => fakerSingleRestaurantEntity);

Restaurant get fakerSingleRestaurantEntity => Restaurant(
      id: faker.randomGenerator.string(22),
      name: faker.company.name(),
      categories: [faker.company.name()],
      price: List.generate(random.integer(4), (_) => '\$').join(),
      photos: [faker.image.loremPicsum()],
      rating: random.decimal(min: 1, scale: 5),
      isCLosed: random.boolean(),
      address: faker.address.streetName(),
    );

RestaurantModel get fakerRestaurantModel => RestaurantModel(
      id: faker.randomGenerator.string(22),
      name: faker.company.name(),
      categories: [faker.company.name()],
      price: List.generate(random.integer(4), (_) => '\$').join(),
      photos: [faker.image.loremPicsum()],
      rating: random.decimal(min: 1, scale: 5),
      isCLosed: random.boolean(),
      address: faker.address.streetName(),
    );
