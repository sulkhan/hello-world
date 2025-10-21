# Birthday Countdown App

A simple iPhone app that calculates the number of days left until your next birthday.

## Features

- Select your date of birth using an intuitive date picker
- Calculate days remaining until your next birthday
- Beautiful, animated UI with SwiftUI
- Special message when it's your birthday!

## How It Works

1. **Enter Your Birthday**: Use the date picker to select your birth date
2. **Calculate**: Tap the "Calculate Days Left" button
3. **View Results**: See how many days are left until your next birthday

The app automatically calculates the next occurrence of your birthday:
- If your birthday hasn't occurred yet this year, it shows days until this year's birthday
- If your birthday has already passed this year, it shows days until next year's birthday
- If today is your birthday, you get a special birthday message!

## Technical Details

- Built with SwiftUI
- Compatible with iOS 14.0+
- Supports both iPhone and iPad
- Uses native iOS Calendar API for accurate date calculations

## How to Run

1. Open the project in Xcode
2. Select your target device or simulator
3. Press Run (⌘R)

## Project Structure

```
BirthdayCountdown/
├── BirthdayCountdown/
│   ├── BirthdayCountdownApp.swift  # App entry point
│   ├── ContentView.swift            # Main UI and logic
│   ├── Info.plist                   # App configuration
│   └── Assets.xcassets/             # App assets and icons
└── README.md
```

## Implementation Details

The app uses:
- `DatePicker` for user-friendly date selection
- `Calendar` API for accurate date calculations
- SwiftUI animations for smooth transitions
- State management with `@State` property wrapper
