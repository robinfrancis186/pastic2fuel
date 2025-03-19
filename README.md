# 🌱 Plastic to Fuel App

A Flutter application for tracking and managing plastic waste conversion to fuel, promoting environmental sustainability.

## 📖 Table of Contents
- [Features](#-features)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [Architecture](#-architecture)
- [Screenshots](#-screenshots)
- [Built With](#️-built-with)
- [Contributing](#-contributing)
- [Troubleshooting](#-troubleshooting)
- [License](#-license)

## ✨ Features

### 👤 User Authentication
- Secure login and registration with email/password
- Profile management with user details and statistics
- Secure session handling with token-based authentication
- Password reset functionality
- Remember me option

### ♻️ Plastic Collection
- Record waste collections with:
  - Multiple plastic types (PET, HDPE, LDPE, PP)
  - Weight measurement
  - Collection date and time
  - Location tracking
- View collection history with filtering options
- Generate collection reports
- Track collection statistics

### ⛽ Fuel Production
- Track conversion process step by step
- Record production details:
  - Fuel type (Diesel, Gasoline, Kerosene)
  - Volume produced
  - Plastic quantity used
  - Production date
  - Facility information
- Monitor conversion efficiency
- View production history and analytics

### 📊 Dashboard
- Real-time statistics showing:
  - Total plastic collected
  - Total fuel produced
  - Environmental impact metrics
  - Recent activities
- Educational content about:
  - Plastic types
  - Conversion process
  - Environmental impact
  - Best practices

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Android SDK / Xcode (for iOS)
- Git

### Installation

1. Clone the repository
   ```bash
   git clone https://github.com/robinfrancis186/pastic2fuel.git
   ```

2. Navigate to project directory
   ```bash
   cd pastic2fuel
   ```

3. Install dependencies
   ```bash
   flutter pub get
   ```

4. Run the app
   ```bash
   flutter run
   ```

### Environment Setup

1. Create a `.env` file in the root directory
   ```env
   API_BASE_URL=your_api_url
   GOOGLE_MAPS_API_KEY=your_maps_api_key
   ```

2. Configure Firebase (optional)
   - Create a Firebase project
   - Download `google-services.json` for Android
   - Download `GoogleService-Info.plist` for iOS
   - Place them in their respective directories

## 📁 Project Structure
```
lib/
├── models/          # Data models
│   ├── user.dart
│   ├── plastic_collection.dart
│   └── fuel_production.dart
├── providers/       # State management
│   ├── auth_provider.dart
│   ├── plastic_collection_provider.dart
│   └── fuel_production_provider.dart
├── screens/         # UI screens
│   ├── auth/
│   ├── home/
│   ├── collection/
│   └── production/
├── widgets/         # Reusable components
├── utils/          # Helper functions
├── services/       # API services
└── main.dart       # Entry point
```

## 🏗️ Architecture

The app follows a Provider-based architecture with:
- **Models**: Data structures
- **Providers**: State management
- **Services**: API communication
- **Screens**: UI components
- **Widgets**: Reusable UI elements

### State Management
- Uses Provider package for state management
- Follows repository pattern for data handling
- Implements dependency injection

## 🔧 Troubleshooting

### Common Issues

1. Build Errors
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

2. Android Studio Issues
   - Update Flutter and Dart plugins
   - Invalidate caches and restart

3. iOS Build Issues
   ```bash
   cd ios
   pod install
   cd ..
   flutter run
   ```

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. Fork the repository
2. Create your feature branch
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. Commit your changes
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. Push to the branch
   ```bash
   git push origin feature/AmazingFeature
   ```
5. Open a Pull Request

### Coding Guidelines

- Follow Dart's style guide
- Write meaningful commit messages
- Add comments for complex logic
- Include tests for new features
- Update documentation

## 🛠️ Built With

- [Flutter](https://flutter.dev/) - UI Framework
- [Provider](https://pub.dev/packages/provider) - State Management
- [SharedPreferences](https://pub.dev/packages/shared_preferences) - Local Storage
- [HTTP](https://pub.dev/packages/http) - API Integration
- [intl](https://pub.dev/packages/intl) - Internationalization
- [url_launcher](https://pub.dev/packages/url_launcher) - URL Handling

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📱 Screenshots

Coming soon...

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- All contributors who participate in this project
- The environmental community for inspiration
