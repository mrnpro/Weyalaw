<p align="center">
  <img src="assets-/g-wide.svg" alt="Weyalaw Logo" width="261" height="55"/>
</p>

# Weyalaw 🚕

A Flutter-based mobile application designed to help Ethiopian commuters easily locate and navigate traditional bus taxi routes.

## Problem Statement 🎯

In Ethiopia, affordable public transportation options, such as traditional bus taxis, play a vital role in daily commuting. However, locating these taxis, particularly for less familiar routes, can be challenging due to:

- Lack of centralized information
- No real-time updates on taxi locations
- Difficulty finding correct pick-up points
- Limited knowledge of routes for unfamiliar destinations
- Time wasted waiting at incorrect stops

Weyalaw seeks to address these issues by offering a user-friendly platform that enables commuters to locate traditional bus taxis in real-time, access detailed information about popular routes, and receive personalized recommendations.

## Features ✨

- **Location Search**: Search for any location and find nearby taxi stations
- **Route Planning**: Get optimal routes between your location and Taxi Place
- **Price Estimation**: View estimated taxi fares for your journey
- **Real-time Navigation**: Interactive maps with turn-by-turn directions

## GebetaMaps API Integration 🗺️

The project utilizes GebetaMaps API for the following services:

### Direction Service
- Calculates optimal public transport routes
- Identifies traditional taxi routes between locations
- Provides estimated travel times

### Geocoding Service
- Converts location names to coordinates
- Enables search functionality for destinations
- Identifies nearby landmarks for pick-up points

### Reverse Geocoding
- Converts coordinates to readable addresses
- Helps identify current location context
- Provides landmark references for users

## Google Maps API Integration 🗺️

> **Important Note:** While GebetaMaps provides excellent location services and routing APIs specifically optimized for Ethiopian transportation, it currently doesn't provide the actual map visualization service. Therefore, we use Google Maps to render and display the map interface. This is why both API keys are required - GebetaMaps for Ethiopian-specific location services and Google Maps for the visual map implementation.

The project utilizes Google Maps API for the following services:

### Interactive Maps
- Map visualization and rendering
- Real-time navigation interface
- Custom markers for taxi stations

## Getting Started 🚀

### Prerequisites
- Flutter SDK (^3.27.1)
- Android Studio (version 2024.1)
- Android SDK (version 35.0.0)
- Xcode 16.0 or higher (for iOS)
- VS Code (version 1.96.4) [Optional]
- Chrome (for web development) [Optional]
- GebetaMaps API key
- Google Maps API key
- Git

> **Note:** Make sure to run `flutter doctor` to verify your setup is complete

### Installation

1. Clone the repository
```bash
git clone https://github.com/mrnpro/Weyalaw.git
cd Weyalaw
```

2. Create environment files:

**.env** in root directory:
```
GEBETA_MAPS_API_KEY=your_gebeta_api_key_here
```

3. Set up Google Maps:

**For iOS:**
```bash
# 1. Copy the template configuration file
cp ios/Runner/Config.xcconfig.template ios/Runner/Config.xcconfig

# 2. Edit Config.xcconfig and add your Google Maps API key
# Replace 'your_google_maps_api_key_here' with your actual API key

# 3. Link Config.xcconfig to your build configurations in Xcode:
# - Open ios/Runner.xcworkspace in Xcode
# - Click on 'Runner' project in the Project Navigator
# - Select 'Runner' project (not target) in the left sidebar
# - Go to 'Info' tab
# - Under 'Configurations' section:
#   - For 'Debug' configuration: Select Config.xcconfig
#   - For 'Release' configuration: Select Config.xcconfig

# Note: If 'Configurations' section is missing:
# - Click '+' button next to 'Configurations'
# - Duplicate 'Debug' and 'Release' configurations
# - Set Config.xcconfig for both configurations
```

**For Android:**
```bash
# 1. Create/edit android/local.properties and add:
google.maps.key=your_google_maps_api_key_here

# 2. Create/edit android/app/src/main/res/values/strings.xml and add:
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="google_maps_key">your_google_maps_api_key_here</string>
</resources>
```

4. Install dependencies
```bash
flutter pub get
```

5. Run pod install for iOS
```bash
cd ios
pod install
cd ..
```

6. Run the app
```bash
flutter run
```

### API Keys Setup

#### Google Maps API Key
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing one
3. Enable Maps SDK for iOS and Android
4. Create credentials (API key)
5. Add the API key to:
   - iOS: `ios/Runner/Config.xcconfig`
   - Android: `android/local.properties`

#### GebetaMaps API Key
1. Sign up at [GebetaMaps](https://gebeta.app/)
2. Get your API key
3. Add it to the `.env` file

## Required Permissions 📱

- Location access
- Internet connectivity
- Background location updates

## Features in Detail 🗺️

### GebetaMaps Integration
- Direction Service for optimal routes
- Geocoding for location search
- Reverse geocoding for address lookup

### Google Maps Integration
- Interactive maps
- Real-time navigation
- Custom markers for taxi stations

## Contributing 🤝

Contributions are welcome! Please feel free to submit a Pull Request.

## Download 📱

You can download and test the latest version of Weyalaw:

[<img src="https://img.shields.io/badge/Download-APK-green.svg?style=for-the-badge&logo=android" 
      height="80"
      alt="Download APK">](assets-/app-release.apk)

> **Note:** Make sure to enable "Install from Unknown Sources" in your Android settings to install the APK.

## Acknowledgments 🙏

- GebetaMaps for providing the mapping API 
- [Redat](https://redat.vercel.app/) for taxi route and fare data
  - Used their API for accurate taxi fare information
  - Leveraged their comprehensive database of Ethiopian taxi routes
- [Trufi Association](https://trufi-association.org/#projects) for inspiration and APIs for informal transport solutions
  - Used their open-source APIs and tools for public transport routing
  - Based on their proven solutions for informal transportation systems

## Contact 📧

For any queries or suggestions, please open an issue in the repository.

---
Made with ❤️ for Ethiopian commuters
