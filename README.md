# Flutter E-commerce App - Technical Test

This Flutter project is an e-commerce application that displays a list of products, allows users to view product details, and add products to a cart. The application utilizes Flutter for the user interface, Provider for state management, and Dio for network requests. It also uses the `logger` package for logging and FVM for managing Flutter versions.

## Flutter Version that used
```bash
    3.10.6
   ```

## Installation

1. Clone the repository to your local machine:

   ```bash
   git clone <repository_url>
   ```

2. Change directory to the project folder:

   ```bash
   cd wireapps
   ```

3. Set the Flutter version using FVM (assuming you have FVM installed):

   ```bash
   fvm use
   ```

4. Install the project dependencies:

   ```bash
   fvm flutter pub get
   ```

## Running the App

To run the application on an emulator or physical device, use the following command:

```bash
fvm flutter run
```

## Features

The application offers the following features as per the provided task:

- Display a list of products with key details.
- Click on a product to view its details.
- Add products to a cart.
- View the cart with a list of selected products and the total price.

## Code Structure

The project follows the best practices for Flutter application architecture, including separation of concerns and code modularity. Here's a brief overview of the project structure:

- `lib` folder contains the main source code.
  - `main.dart` is the entry point of the application.
  - `api` folder includes classes that i am using for api calls using DIO.
  - `controller` folder contains the state management using the Provider package.
  - `models` folder includes the data models for products and prices.
  - `screens` folder contains the UI screens for the product list, product details, and cart.
- `pubspec.yaml` lists the project dependencies.
- `.fvm` folder contains FVM configuration for Flutter version management.

## API Endpoint

The application fetches product data from the following API endpoint:

- API endpoint: [https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/products.json](https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/products.json)

## Contact

If you have any questions or need assistance, please contact [bthalinda@gmail.com](bthalinda@gmail.com).

