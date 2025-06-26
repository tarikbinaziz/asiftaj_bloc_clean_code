# asiftaj_bloc_clean_code

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Barrel File
  A barrel file in programming is a way to organize and simplify imports in a project by creating a single file that re-exports content (like functions, classes, constants, etc.) from multiple files.
  
  🔚 Bottom line:
        barrel.dart always should be in the same folder where the exported files live. That keeps structure clean and logical.

# 🔹 components Folder:
  components folder-e reusable UI widgets thake, ja onno onno screen, page, or widget theke repeatable vabe use kora jai.

   lib/
└── components/
    ├── buttons/
    │   ├── primary_button.dart
    │   └── icon_button.dart
    ├── text_fields/
    │   └── custom_text_field.dart
    ├── dialogs/
    │   └── confirm_dialog.dart
    ├── cards/
    │   └── product_card.dart
    ├── images/
    │   └── network_image_with_placeholder.dart
    └── app_bar/
        └── custom_app_bar.dart
