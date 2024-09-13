String query = '''
  query Restaurants {
  search(location: "Las Vegas") {
    business {
      name
      price
      photos
      rating
      is_closed
      location {
        address1
      }
    }
  }
}
  ''';
