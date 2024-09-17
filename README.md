# Flutter superformula

This project consumes the Yelp API to display information about local businesses.

## Installation

1. Rename the `.env.dist` file to `.env`.
2. Add your Yelp API Key in the `.env` file.
3. Install the required dependencies and run the project:

```bash
fvm flutter run
```

## Architecture
The project follows a simple Clean Architecture, divided into layers:

## Datasources: 
Responsible for fetching data, such as the integration with the Yelp API.

## Repositories:
Serve as the intermediary between datasources and use cases, transforming data for practical use.
### Usecases: 
Contain the business logic of the application.

## State management, 
I used BLoC, ensuring a clear separation between the interface and business logic. Additionally, the Dartz library was utilized to assist with error handling and returns between layers.

## Tests
I tested some layers of the application, enough to demonstrate how I typically structure and perform testing.