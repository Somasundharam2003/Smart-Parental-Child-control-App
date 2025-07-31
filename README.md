# Smart Parental Control App

An advanced **Parental Control App** built using **Flutter & Firebase**, designed to help parents monitor and manage their child's digital behavior. It consists of two separate apps: **Parent App** and **Child App**, each with tailored features for their respective roles.

---

## Features

### Parent App
- Login & Registration
- Real-time Child Location Tracking using Google Maps
- Screen Time Management
- Remote Device Control (lock device, restrict apps)
- App Usage Monitoring
- Instant SOS Notifications
- Auto Background Sync via Firebase

### Child App
- Location Tracking (Foreground & Background)
- App Usage Statistics Monitoring
- SOS Trigger Button
- Sync Data to Firebase
- Restricted Access to System Settings

---

## Tech Stack

| Layer        | Tech Used                |
|--------------|--------------------------|
| Frontend     | Flutter, Dart            |
| Backend      | Firebase Auth, Firestore, Firebase Realtime DB |
| Location     | Geolocator, Google Maps API |
| Background   | Workmanager, Flutter Background Geolocation |
| Cloud        | Firebase Cloud Messaging |
| Platform     | Android (iOS in roadmap) |

---

## Project Structure

smart_parental_control_app/
│
├── parent_app/
│ ├── lib/
│ │ ├── screens/
│ │ ├── services/
│ │ └── widgets/
│ └── pubspec.yaml
│
├── child_app/
│ ├── lib/
│ │ ├── screens/
│ │ ├── services/
│ │ └── background_tasks/
│ └── pubspec.yaml
│
└── README.md



---

## Setup Instructions

1)Download the firbase app intergartion file manually by creating firebase project 
2)then place it in the app/google.json file

3)For Google maps api ,Register in google maps and get a Api key 
4)The api key is placed in the app level android manifest file ->in this line 
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="${MAPS_API_KEY}"/>
    

### Prerequisites
- Flutter SDK (latest version)
- Android Studio or VS Code
- Firebase Project (enable Auth, Firestore, FCM, Realtime DB)

### Firebase Setup
1. Create a Firebase project.
2. Enable Email/Password authentication.
3. Add Android apps (both parent and child) and download `google-services.json`.
4. Place `google-services.json` in each app's `android/app/` directory.

### Run App
```bash
# For Parent App
cd parent_app
flutter pub get
flutter run

# For Child App
cd child_app
flutter pub get
flutter run

Highlights
Promotes safe and healthy digital habits

Real-time two-way communication between apps

Firebase-powered analytics and data syncing

Modular and scalable Flutter architecture

Contributors
Somasundharam Premnath – MIT, Chennai
LinkedIn: Somasundharam Premnath
Email: somasundharampremnath2003@gmail.com

Future Improvements
iOS Support

AI-based App Recommendation Engine

Encrypted Chat between Parent & Child

Browser Plugin for Web Filtering


This project is under the CSRC - ANNA UNIVERSITY Student innovative project 2024-2025
