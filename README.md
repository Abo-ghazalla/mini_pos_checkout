# Mini-POS Checkout Core

- **Flutter**: 3.32.0
- **Dart**: 3.8.0

## Folder Structure

```
├─ lib/
│ └─ src/
│ ├─ catalog/
│ │ ├─ item.dart
│ │ └─ catalog_bloc.dart
│ ├─ cart/
│ │ ├─ models.dart
│ │ ├─ cart_bloc.dart
│ │ └─ receipt.dart
│ └─ util/
│ │ ├─ cart_helper.dart
│ │ ├─ json_reader.dart
├─ assets/
│ └─ catalog.json
├─ test/
│ ├─ catalog_bloc_test.dart
│ └─ cart_bloc_test.dart
└─ pubspec.yaml
```

## How to run tests

To set up and run all automated tests for this package:

```
flutter pub get
flutter test
```



## Time, Finished & Skipped

- **Time spent:** *3 hours*
- **Finished:** All must-have items and Cart hydration
- **Skipped:** Undo/redo, money formatting extension and Undo / redo last N cart actions.


## Notes
- Optional items (undo/redo, 100% coverage) not implemented due to time.
- Only implement hydration as it was the first time for me to know about hydrated_bloc and I fount it interesting
- All state, events, models are immutable and pass analyzer checks.

