# HTTP Setup Guide

This document explains how HTTP is set up in this project and how to use it.

## Current Setup

- Package: `http` is added in `pubspec.yaml`.
- Service file: `lib/core/services/api_service.dart`.
- Main class: `ApiService`.
- Error class: `ApiException`.

## What `ApiService` Provides

- Reusable HTTP client for the app.
- Configurable `baseUrl`.
- `GET` and `POST` request methods.
- Query parameter support.
- JSON request/response handling.
- Timeout support (default: 30 seconds).
- Unified API error handling through `ApiException`.

## File Location

`lib/core/services/api_service.dart`

## Quick Usage

```dart
import 'package:nectar/core/services/api_service.dart';

final api = ApiService(baseUrl: 'https://your-api.com');

final products = await api.get('/products');

final login = await api.post(
  '/login',
  body: {
    'email': 'user@mail.com',
    'password': '123456',
  },
);
```

## GET Request Example

```dart
final result = await api.get(
  '/items',
  queryParameters: {'page': '1', 'limit': '20'},
  headers: {'Authorization': 'Bearer your_token'},
);
```

## POST Request Example

```dart
final result = await api.post(
  '/orders',
  headers: {'Authorization': 'Bearer your_token'},
  body: {
    'itemId': 101,
    'quantity': 2,
  },
);
```

## Error Handling Example

```dart
try {
  final data = await api.get('/profile');
  // use data
} on ApiException catch (e) {
  // server/network response error
  print('API Error: ${e.message}');
} catch (e) {
  // unexpected error
  print('Unexpected Error: $e');
}
```

## Good Practice

- Create one shared `ApiService` instance for the app (for example in provider/service layer).
- Keep endpoints in constants for easier maintenance.
- Do not write URLs directly inside UI widgets.
- Call `dispose()` if you create and destroy clients manually.

## Next Step Suggestion

Integrate `ApiService` into a provider (such as `AuthProvider` or `CartProvider`) so UI screens load data from the API instead of only local state.
