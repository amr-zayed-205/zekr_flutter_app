# 🌿 Zekr App -- Islamic Remembrance Application

A clean, modern Islamic remembrance (Azkar) application built with
**Flutter**, focusing on simplicity, calm UI, and smooth user
experience.

## ✨ Features

-   📿 Morning Azkar
-   🌙 Evening Azkar
-   🕌 Post-Prayer Azkar
-   🔢 Digital Tasbih with persistent counter
-   💾 Progress saved automatically
-   🎨 Unified color theme
-   ✨ Smooth animations

## 📱 Screenshots

Place screenshots inside `screenshots/` folder:

-   splash.png
<div align="center">
  <img src="screenshots/azkar.png" width="250" />
  <img src="screenshots/home.png" width="250" />
  <img src="screenshots/tasbih.png" width="250" />
</div>
-   all screens.png

## 📂 Project Structure

```
lib/
├── core/
│   └── app_colors.dart      
│
├── models/
│   └── zekr_model.dart      
│
├── services/
│   └── azkar_service.dart     # JSON loading + local storage
│
├── screens/
│   ├── splash_page.dart
│   ├── home.dart
│   ├── azkar_page.dart
│   └── tasbih_page.dart
│
├── widgets/
│   ├── bottom_nav.dart
│   ├── zekr_card.dart
│   ├── azkar_header.dart
│   └── home/
│       ├── greeting_section.dart
│       ├── prayer_card.dart
│       ├── main_azkar_row.dart
│       └── more_azkar_section.dart
│
├── layouts/
│   └── main_layout.dart      
│
└── main.dart                 

```

## 🧠 How It Works

-   Azkar loaded from JSON
-   Progress saved with SharedPreferences
-   Simple StatefulWidget logic
-   Bottom navigation layout

## 🛠 Built With

-   Flutter
-   Material Design
-   SharedPreferences

## 📌 Summary

This project demonstrates clean Flutter navigation, reusable UI design, and practical state handling in a real-world mobile application.

