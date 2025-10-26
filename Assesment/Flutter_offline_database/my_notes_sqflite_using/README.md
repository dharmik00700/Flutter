# MyNotes - Offline Note Manager

Simple Flutter app that stores notes locally using SQLite (`sqflite`).

## Features
- Splash screen (2 seconds)
- Home list of notes (title, shortened description, date)
- Add note with validation
- Edit note (pre-filled)
- Delete note with confirmation
- Offline search/filtering by title/description

## Setup
1. Ensure Flutter SDK is installed.
2. Clone the repo.
3. In project folder: `flutter pub get`
4. Run on device/emulator: `flutter run`

## Notes
- DB file stored in app documents directory.
- Uses `sqflite` and `path_provider`.
