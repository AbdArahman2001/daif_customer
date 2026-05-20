# Dayf App (Customer Application)

## Project Overview

Dayf App is a comprehensive platform for booking tourist accommodations, with this specific repository focusing on the **customer-facing application**. This application is designed to provide users with a seamless and intuitive experience for discovering, booking, and managing their accommodation reservations. Built with Flutter, it ensures a rich, consistent, and performant user experience across both Android and iOS platforms.

## Key Features

### 1. Seamless Booking Experience
*   **Intuitive Search & Discovery**: Users can easily search for accommodations with robust filtering options and precise location-based discovery using integrated mapping services.
*   **Effortless Booking Process**: A streamlined booking flow, potentially featuring a multi-step checkout process for user convenience.
*   **Booking Calendar Integration**: Utilizes `booking_calendar` for easy selection and management of reservation dates.

### 2. Location-Based Services & Navigation
*   **Google Maps Integration**: Leverages Google Maps SDK for displaying accommodation locations, facilitating navigation, and enhancing geographical context.
*   **Precise Geolocation**: Integrates `Geolocator` and `geocoding` for accurate user location detection and location-based search functionalities.

### 3. Enhanced User Interface & Experience
*   **Dynamic UI Adaptation**: `flutter_screenutil` ensures the user interface adapts seamlessly to various screen sizes and densities.
*   **Rich Media Display**: `cached_network_image` for efficient image loading and caching, `carousel_slider` for engaging image galleries, and `photo_view` for interactive image viewing (zoom/pan).
*   **Engaging Animations**: Incorporates `lottie` for beautiful and smooth animations, enhancing the overall user experience.
*   **Interactive Elements**: Features like `pin_code_fields` for secure input and `dotted_border` for visual styling contribute to a polished interface.

### 4. Core Functionalities
*   **Network Communication**: `dio` is used as a powerful HTTP client for robust and efficient API interactions.
*   **State Management**: `GetX` is utilized for efficient state management, dependency injection, and simplified routing within the application.
*   **Local Data Storage**: `shared_preferences` for lightweight, persistent local data storage.
*   **Notifications**: `flutter_local_notifications` for managing and displaying local notifications to users.
*   **Internationalization**: `intl` for supporting multiple languages and locales, providing a global reach.
*   **Utility & Helper Functions**: A well-structured `utill` and `helper` layer for common functionalities and reusable code.

## Technologies and Expertise Used

This customer application is developed with a focus on modern mobile development practices, ensuring performance, maintainability, and a great user experience.

### 1. Framework and Language
*   **Flutter**: Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
*   **Dart**: The programming language used for Flutter development.

### 2. Application Architecture and State Management
*   **Clean Architecture Principles**: The project structure (evident in `controller`, `data`, `view` layers) suggests adherence to Clean Architecture principles, promoting separation of concerns, testability, and maintainability.
*   **GetX**: A robust and performant solution for state management, dependency injection, and route management in Flutter applications.

### 3. Key Libraries and Dependencies (from `pubspec.yaml`)
*   **UI/UX**: `cupertino_icons`, `shimmer`, `flutter_screenutil`, `carousel_slider`, `cached_network_image`, `dotted_border`, `photo_view`, `lottie`, `pin_code_fields`.
*   **Networking & Data**: `dio`, `connectivity`, `shared_preferences`, `path_provider`.
*   **Location & Maps**: `geocoding`, `geolocator`, `flutter_google_places`, `google_maps_flutter`.
*   **Core App Functionality**: `get` (GetX), `intl`, `flutter_local_notifications`, `booking_calendar`, `string_validator`, `infinite_scroll_pagination`, `package_info_plus`, `store_redirect`.

## Getting Started

To set up and run the customer application locally, follow these steps:

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/AbdArahman2001/daif_customer.git
    cd daif_customer
    ```

2.  **Get dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run the app**:
    ```bash
    flutter run
    ```

## Contributing

Contributions are welcome! If you have any suggestions or improvements, feel free to open an issue or submit a pull request.


## Contact Us

For inquiries or support, please contact bdalrhmnalslyby710@gmail.com.

---
