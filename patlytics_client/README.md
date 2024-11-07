# patlytics_client

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Architecture
lib/
├── app/                # Entry point & app-wide configs
│   ├── main.dart       # Main entry file
│   ├── routes.dart     # Route definitions
│   ├── theme.dart      # Theme and styling
│   └── di.dart         # Dependency Injection setup
├── core/               # Core utilities & shared logic (framework-agnostic)
│   ├── errors/         # Error and exception classes
│   ├── usecases/       # Use cases / business rules
│   ├── utils/          # Common utility functions
│   └── constants.dart  # App-wide constants
├── features/           # Each feature follows its own mini-architecture
│   ├── auth/           # Example feature: Authentication
│   │   ├── data/
│   │   │   ├── datasources/  # Remote & local data sources (e.g., API)
│   │   │   ├── models/       # Data models
│   │   │   └── repositories/ # Implementations of repositories
│   │   ├── domain/
│   │   │   ├── entities/     # Core entities related to this feature
│   │   │   ├── repositories/ # Repository interfaces
│   │   │   └── usecases/     # Business logic, defined in use case classes
│   │   └── presentation/
│   │       ├── blocs/        # State management (BLoC/Cubit/Provider)
│   │       ├── screens/      # UI screens
│   │       └── widgets/      # Reusable widgets within the feature
│   └── another_feature/ # Repeat this structure for other features
└── shared/              # Common/shared widgets & components
├── widgets/         # Shared UI components (buttons, dialogs)
├── styles/          # Styling resources (colors, fonts)
└── localization/    # Language localization files
