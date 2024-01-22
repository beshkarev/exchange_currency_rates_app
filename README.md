# Currency Exchange App

This Flutter application is designed to provide users with real-time foreign exchange currency rates and historical exchange rates for a specific currency. The app fetches data from a specified currency exchange API, caches the rates in a local database, and periodically updates the rates from the API. Let's explore the key features and the flow of the app.

## Objective

The main objectives of this coding assignment are as follows:
- Build a Flutter app that fetches foreign exchange currency rates from an API.
- Create a screen for displaying the current exchange rates fetched from the API.
- Develop a secondary screen for viewing the historical exchange rates of a specific currency.
- Implement data caching to store retrieved rates in a local database (SQLite is recommended).
- Periodically refresh the rates from the API every X seconds.

## Key Features

### API Integration
- Connects to a specified currency exchange API to retrieve real-time rates.

### Data Caching
- Stores retrieved rates in a local database (SQLite is recommended) for the history page.

### Periodic Updates
- Fetches fresh rates from the API every X seconds to ensure users have the latest information.

## App Flow

1. **Launch Screen:**
    - Upon launching the app, users will see a list of current currency exchange rates based on the data returned from the API.

2. **Auto-refresh:**
    - The list of currency exchange rates will automatically refresh every X seconds based on the API response, providing users with up-to-date information.

3. **Local Data Storage:**
    - All data retrieved from the API is cached locally on the device, ensuring offline access and reducing dependency on the network.

4. **Secondary Screen:**
    - Tapping on a specific currency will navigate users to a secondary screen.

5. **Currency History:**
    - The secondary screen will display the historical rates of the selected currency, providing users with insights into the currency's past performance.

## Notes

**Auto-refresh:**
    - Seen the .env file in the project root if you want to change the auto-refresh rate 
    - Change the CURRENCY_REQUESTS_INTERVAL_SEC
    - Run ```bash
    dart run build_runner build --delete-conflicting-outputs
    - Recompile the project
