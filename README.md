## Overview

This project is developed using **Swift** and **SwiftUI** and follows the **MVVM (Model-View-ViewModel)** architecture pattern. It is designed to efficiently manage activities and screens, providing flexible methods for fetching data either from an API or from local files.

**Demo Video:** 
https://drive.google.com/file/d/1YchzylKOkzubuVNMl-11VV7jL7lVV6ON/view?usp=sharing

## Features

- **Language**: Built with **Swift** and utilizes **SwiftUI** for creating user interfaces.
- **MVVM Architecture**: Employs the MVVM architecture to ensure a clean separation of concerns between the UI and business logic, making the codebase more maintainable.
- **Data Fetching**: Supports two methods for fetching data:
  - **Using API**: Dynamically fetch data from a remote server via network requests.
  - **Using Local File**: Load data from local JSON files for offline access and testing purposes.
- **Flexible Activity Management**: Activities can be easily managed and removed, as the project uses **enums** to handle all types of screens effectively, simplifying the process of adding or modifying screens.

## Project Structure

- **Model**: Contains data structures and business logic, representing the application's core data.
- **View**: Comprises all UI components and views built using SwiftUI.
- **ViewModel**: Acts as an intermediary between the Model and the View, managing data fetching, state, and business logic.

## Summary of Key Components

- **OnboardingView**: Serves as the entry point, displaying either a module overview or options for fetching data.
- **BaseView**: Acts as the main content holder, presenting dynamic screens based on the user's progress.
- **NavigationView**: Provides navigation controls (progress bar and buttons) to facilitate movement between steps.
- **Dynamic Views**:
  - **QandAView**: Renders specific content for questions and answers.
  - **RecapView**: Displays recap information based on user interactions.
- **FeedbackView**: Used to provide feedback on the user's answers, allowing them to continue based on the result of their input.


### Prerequisites

Ensure you have the following installed:

- Xcode (latest version recommended)
- Swift (Swift 5 or later)
