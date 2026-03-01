# Currency Converter (Flutter + Riverpod)

A modern **Currency Converter application** built using **Flutter**, **Riverpod**, and **Clean Architecture** principles.
The app allows users to convert multiple currencies into a selected base currency using live exchange rates.

---

# Features

• Fetch live currency exchange rates from API
• Convert **multiple currencies to a base currency**
• Dynamic currency input rows
• Select base currency from settings
• Currency dropdown populated from **Symbols API**
• Total conversion calculation
• Responsive UI for multiple screen sizes
• Proper error handling
• Unit tests for ViewModel and Repository

---

# Architecture

This project follows **Clean Architecture + MVVM pattern**.

```
lib
│
├── core
│   ├── constants
│   │   ├── api_constants.dart
│   │   └── app_constants.dart
│   │
│   ├── errors
│   │   └── app_exception.dart
│   │
│   ├── network
│   │   └── dio_client.dart
│   │
│   ├── routes
│   │   └── app_router.dart
│   │
│   └── utils
│       └── currency_calculator.dart
│
├── data
│   ├── datasources
│   │   └── remote
│   │       └── exchange_remote_datasource.dart
│   │
│   ├── models
│   │   ├── currency_input.dart
│   │   ├── currency_model.dart
│   │   ├── exchange_rate_model.dart
│   │   ├── exchange_rate_response.dart
│   │   ├── settings_model.dart
│   │   └── symbols_response.dart
│   │
│   └── repositories
│       └── exchange_repository_impl.dart
│
├── domain
│   ├── entities
│   │   └── exchange_rate_entity.dart
│   │
│   └── repositories
│       └── exchange_repository.dart
│
├── presentation
│   ├── providers
│   │   └── app_providers.dart
│   │
│   ├── screens
│   │   ├── currencies
│   │   │   └── currencies_list_screen.dart
│   │   │
│   │   ├── home
│   │   │   └── home_screen.dart
│   │   │
│   │   └── settings
│   │       └── settings_screen.dart
│   │
│   ├── state
│   │   └── exchange_state.dart
│   │
│   ├── viewmodels
│   │   └── exchange_viewmodel.dart
│   │
│   └── widgets
│       ├── add_currency_button.dart
│       ├── amount_textfield.dart
│       ├── currency_dropdown.dart
│       ├── currency_input_row.dart
│       ├── error_widget.dart
│       ├── loading_widget.dart
│       └── total_display_card.dart
│
├
│
└── main.dart

test
│
├── data
│   └── repositories
│       └── exchange_repository.dart
│
├── presentation
│   └── viewmodels
│       └── exchange_viewmodel_test.dart
│
└── widget_test.dart
```

---

# State Management

The project uses **Riverpod** for state management.

Responsibilities of ViewModel:

• Fetch exchange rates
• Fetch currencies list
• Manage currency rows
• Calculate total value
• Handle UI state

---

# API Integration

The app integrates with an exchange rate API providing:

### Latest Rates API

```
GET /latest
```

Example response:

```
{
  "base": "USD",
  "rates": {
    "EUR": 0.91,
    "INR": 83.2
  }
}
```

### Symbols API

```
GET /symbols
```

Used to populate the currency dropdown list.

---

# Error Handling

Centralized error handling is implemented using:

```
core/errors/app_exception.dart
```

Handled exceptions:

• Network errors
• Unauthorized requests
• Server errors
• Invalid responses

---

# Responsive UI

UI adapts across different screen sizes using:

• Flexible layouts
• Expanded widgets
• Scrollable content

Ensures compatibility with:

• Mobile devices
• Tablets

---

# Testing

Unit tests are written for:

• ExchangeViewModel
• ExchangeRepositoryImpl

Test location:

```
test/
```

Run tests using:

```
flutter test
```

---

# Dependencies

Main packages used:

```
flutter_riverpod
dio
mocktail
flutter_test
```

---

# How to Run

1. Clone the repository

```
git clone <repo-url>
```

2. Install dependencies

```
flutter pub get
```

3. Run Application

```bash
flutter run
```

---

## Build Android APK

Generate a release APK:

```bash
flutter build apk --release
```

Output location:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## Build Android App Bundle (Recommended for Play Store)

```bash
flutter build appbundle
```

Output location:

```
build/app/outputs/bundle/release/app-release.aab
```

---

## Build iOS IPA

Prerequisites:

* macOS
* Xcode installed
* Apple Developer Account

Build command:

```bash
flutter build ipa --release
```

Output location:

```
build/ios/ipa/
```

---

## Run Tests

```bash
flutter test
```

---

## Clean Build

```bash
flutter clean
flutter pub get
```


# Screens

### Home Screen

• Add multiple currency rows
• Enter amounts
• Select currency
• View total converted value

### Settings Screen

• Change base currency

---

# Future Improvements

• Offline caching for exchange rates
• Searchable currency dropdown
• Currency flags
• Integration tests
• Dark mode support

---

## Author

Developed by **Omkar Shinde**

This project demonstrates a Flutter application built using Clean Architecture,
Riverpod state management, API integration with Dio, and unit testing.


---

