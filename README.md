# News Now & Weather 📰🌤️
**A multi-service mobile application providing real-time global news and live weather updates.**

---

# 📰 News Now - Modern News & Weather App

**News Now** is a professional, high-performance mobile application built with **Flutter**. It provides users with real-time news updates across various categories and live weather information, featuring a sleek UI and robust architecture.

---

## 📸 App Showcase
<p align="center">
  <img src="assets/screenshots/app_pages_light/home.jpg" width="200" alt="Home Light">
  <img src="assets/screenshots/app_pages_dark/home.jpg" width="200" alt="Home Dark">
</p>

## ✨ Key Features
* **Global News Aggregator:** Browse top stories in Sports, Tech, Health, Business, and more.
* **🌍 World Weather Search:** Real-time weather data (Temperature, Humidity, Conditions) for any city globally.
* **External Link Support:** Seamlessly open full news articles in the system browser using **url_launcher**.
* **Real-time Updates:** Powered by live REST APIs for both News and Weather data.
* **Responsive UI:** A clean, modern interface designed for a smooth user experience.

## 🛠 Tech Stack & Tools
* **Framework:** [Flutter](https://flutter.dev/)
* **State Management:** **Cubit / Bloc** (Ensuring a predictable and reactive UI).
* **Networking:** [Dio](https://pub.dev/packages/dio) (Handling multiple API integrations).
* **External Actions:** [url_launcher](https://pub.dev/packages/url_launcher) (To launch web URLs and external applications safely).
* **APIs Integrated:** * [NewsAPI.org](https://newsapi.org/) for global headlines.
    * [OpenWeatherMap](https://openweathermap.org/) (or your used weather provider) for live weather data.

## 📂 Project Architecture
```text
lib/
├── cubits/        # Logic for News and Weather states
├── models/        # Models for News articles & Weather data
├── views/         # UI screens (Home, Weather, Details)
├── widgets/       # Custom reusable components
└── services/      # Service layer for Dio and API calls