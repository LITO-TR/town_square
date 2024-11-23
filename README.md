# TownSquare

## How to Run the Project

Follow these steps to get the project running on your local machine.

1. **Clone this repository** to your local machine:

    ```bash
    git clone <repository-URL>
    cd <repository-name>
    ```

2. Ensure you have **Flutter** installed on your machine. Verify your installation by running:

    ```bash
    flutter doctor
    ```

    (Ensure you are using the recommended stable version of Flutter.)

3. **Install the project dependencies**:

    ```bash
    flutter pub get
    ```

4. To run the app on devices or emulators:

    - **Android**: Use a connected physical device or an emulator.
    - **iOS**: Use an iOS simulator or a physical device with proper permissions.
    - **Web**: To run the app in a web browser, use the following command:


    Run the following command:

    ```bash
    flutter run
    ```

## Assumptions Made

1. The **activity data** is simulated with a local model (`Activity`), as no backend was provided.
2. The **available categories** for filtering activities are:
    - **All**
    - **Sports**
    - **Food**
    - **Kids**
    - **Creative**
    - **Popular**
    - **Calm**
3. I selected **Riverpod** as the state management solution based on personal preference, but I can implement the solution using other state management solutions such as **Flutter Bloc** or **Provider** if necessary.
4. The design is **responsive**, adapting to different screen sizes.
5. The **theme** of the app automatically adapts to the system's default theme of the user's device (light or dark mode).

## What I Would Improve With More Time

1. **Backend Integration**: Connect the app to a backend API for real-time data, allowing dynamic management of activities and user participation.
2. **Advanced Animations**: Implement smoother, more detailed transitions for a richer user experience.
3. **Unit and Integration Testing**: Implement a robust suite of tests to ensure the app's stability and functionality.
4. **Performance Optimization**: Improve initial load time on the web and optimize performance for lower-end devices.
5. **Multilingual Support**: Implement internationalization (i18n) to support multiple languages and regions.

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev/)
- [Firebase Documentation](https://firebase.google.com/docs/flutter/setup)
