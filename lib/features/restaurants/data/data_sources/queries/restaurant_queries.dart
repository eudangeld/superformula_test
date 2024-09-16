const String restaurantListQuery = '''
  query {
  search(location: "Las Vegas") {
    business {
    id
      name
      price
      photos
      rating
      is_closed
      location {
        address1
      }
      categories {
        title
      }
    }
  }
}''';
