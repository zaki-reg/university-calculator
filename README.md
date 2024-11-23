Talib App

A modern and intuitive app for university students in Algeria to calculate semester and annual averages, access academic resources, and enhance their learning experience.

Features
Academic Average Calculator: Calculate semester and annual averages effortlessly.
Resources by Field and Semester: Access curated resources (books, PDFs, YouTube videos) tailored to your field of study and current semester.
Organized Learning: Simplifies studying by providing relevant content according to module programs.
User-Friendly Design: A clean, minimalistic UI that is easy to navigate.
Technologies Used
Flutter (Dart) for cross-platform app development.
Firebase/Node.js (Optional) for backend services.
SQLite/Shared Preferences for local data storage.
Modern UI Design: Inspired by geometric, minimalistic aesthetics.
Setup and Installation
Prerequisites
Flutter SDK installed on your system.
A compatible IDE such as Android Studio or VS Code.
Knowledge of Dart programming.
Clone the Repository
bash
Copy code
git clone https://github.com/yourusername/uni-app.git
cd uni-app
Install Dependencies
Run the following command to fetch all required packages:

bash
Copy code
flutter pub get
Run the App
Connect your device or start an emulator, then execute:

bash
Copy code
flutter run
Project Structure
bash
Copy code

lib/
├── main.dart
├── screens/
├────────── annual_calculator.dart
├────────── history.dart
├────────── home.dart
├────────── name.dart
├────────── semster_calculator.dart
├────────── settings_page.dart
├────────── test.dart
├────────── user_field_year.dart
├────────── welcome.dart
├── constants.dart
├── module_calculator.dart

Contributing
We welcome contributions to make this app even better! If you'd like to contribute:

Fork the repository.
Create a new branch for your feature:
bash
Copy code
git checkout -b feature-name
Commit and push your changes.
Open a pull request.

Planned Features:
Offline Mode: Allow users to calculate averages and access saved resources without internet.
Integration with University Portals: Sync with university-specific academic calendars and resources.
Multi-Language Support: Include English, Arabic, and French.
License
This project is licensed under the MIT License. See the LICENSE file for details.

Contact
For feedback, suggestions, or support, feel free to reach out:

Email: zakig701@gmail.com
