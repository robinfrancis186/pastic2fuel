# Plastic to Fuel App

A mobile application for tracking and managing plastic waste conversion to fuel.

## Features

- **User Authentication**
  - Login and Registration
  - Profile Management
  - Secure Session Management

- **Plastic Collection Tracking**
  - Record plastic waste collections
  - Track collection locations
  - Monitor collection statistics

- **Fuel Production Monitoring**
  - Track fuel production from plastic waste
  - Record production details
  - View production statistics

- **Dashboard**
  - Overview of collections and productions
  - Quick statistics and insights
  - Educational information

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Android SDK for Android deployment
- Xcode for iOS deployment (Mac only)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/p2f_app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd p2f_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── models/          # Data models
├── providers/       # State management
├── screens/         # UI screens
├── widgets/         # Reusable widgets
└── main.dart        # App entry point
```

## Dependencies

- provider: ^6.0.5 (State Management)
- http: ^0.13.5 (API Calls)
- shared_preferences: ^2.1.1 (Local Storage)
- intl: ^0.18.1 (Internationalization)
- url_launcher: ^6.1.11 (URL Handling)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter Team for the amazing framework
- All contributors who participate in this project
