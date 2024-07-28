# movie_app

Flutter project using TheMovieDB API with Clean Architecture practice

# Flutter Clean Architecture Project

This Flutter project is structured based on the principles of Clean Architecture, separating the code into Data, Domain, and Presentation layers.

## Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Screenshots](#screenshots)
- [Video Demo](#video-demo)
- [Getting Started](#getting-started)
- [Running the Project](#running-the-project)

## Overview

This project is designed to demonstrate a scalable and maintainable way to organize your Flutter applications using Clean Architecture. The structure ensures separation of concerns, making it easier to manage and test the application.

## Architecture

### Data Layer
The Data layer is responsible for fetching data from external sources such as APIs or local databases. It contains repositories and data sources.

### Domain Layer
The Domain layer contains the business logic of the application. It includes use cases and repository interfaces.

### Presentation Layer
The Presentation layer handles the UI of the application. It contains the views, state management, and user input handling.

## Screenshots

Here are some screenshots of the application:

<img src="screenshots%2FScreenshot_20240729_021646.png" alt="Screenshot 1" width="300">
<img src="screenshots%2FScreenshot_20240729_021614.png" alt="Screenshot 2" width="300">
<img src="screenshots%2FScreenshot_20240729_021635.png" alt="Screenshot 3" width="300">
<img src="screenshots%2FScreenshot_20240729_021722.png" alt="Screenshot 4" width="300">


## Video Demo
You can watch the video recording of the app [here](https://drive.google.com/file/d/1I-Dm8dOWBp6Jg7jvQ_Qhw0lID0kmHHVW/view).


## Getting Started

To get a local copy up and running, follow these steps:

### Prerequisites

Ensure you have Flutter installed on your local machine. If not, follow the instructions on the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/praveen0308/movie_app.git
    ```
2. Navigate to the project directory:
    ```sh
    cd your_project_directory
    ```
3. Install the dependencies:
    ```sh
    flutter pub get
    ```

4. Generate necessary files using build runner:
    ```sh
    flutter pub run build_runner build
    ```

5. Run the application:
    ```sh
    flutter run
    ```

## Running the Project

To run the project, follow the steps mentioned in the [Installation](#installation) section. After executing `flutter run`, the application should start, and you will be able to see the app running on your connected device or emulator.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Project Link: [https://github.com/praveen0308/movie_app](https://github.com/praveen0308/movie_app)
