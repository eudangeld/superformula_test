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
const String restaurantDetailsQuery = '''
  query GetDetails(\$id: String!){
  business(id:\$id) {
    id
    name
    rating
    price
    is_closed
    photos
     categories {
        title
      }
    reviews {
      rating
      text
      user {
        name
        image_url
      }
    }
    location {
      address1
      state
      city
      postal_code
    }
  }
}''';
