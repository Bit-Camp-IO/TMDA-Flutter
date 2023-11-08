# 📱 TMDA Flutter App

![GitHub license](https://img.shields.io/github/license/Bit-Camp-IO/TMDA-Flutter)
![GitHub last commit](https://img.shields.io/github/last-commit/Bit-Camp-IO/TMDA-Flutter)
![GitHub issues](https://img.shields.io/github/issues/Bit-Camp-IO/TMDA-Flutter)

This repository contains the source code for the TMDA Flutter app, which allows users to browse and search for movies & tv shows using the TMDB API.
The app provides information such as movie & tv shows details, ratings, reviews, and trailers.

📱 App Preview: [Watch On Youtube](https://www.youtube.com/watch?v=k4K8uqwdBMw)
![eFashion in app preview](https://i.imgur.com/9OeuI5B.png)

## 🚀: Features

- Search for movies or tv show by title, genre, or keywords
- View movie or tv show details including cast, release date, and average rating
- Read reviews for movies or tv show
- Watch movie or tv show trailers
- Add movies or tv shows to your watchlist for quick access
- Explore popular movies and tv shows and upcoming releases

## Prerequisites

Before running the app, ensure that you have the following:

- Android Studio (version 2022.2.1 or higher) or VS Code.
- Flutter 3.10 and Dart 3.0.1
- TMDB API key ([Sign up](https://www.themoviedb.org/documentation/api) for an account and obtain an API key)

## Getting Started

To get started with the TMDA Android app, follow these steps:

1. Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/Bit-Camp-IO/TMDA-Flutter.git
```

2. Open Android Studio and select "Open an Existing Project."
3. Navigate to the cloned project directory and select it.
4. Android Studio will build and sync the project automatically.
5. Once the project is synced run `flutter pub get`.
6. After the packages load successfully, navigate to the `lib\core\constants` directory in the project.
7. Open `api_constants.dart` and add the following code, replacing `YOUR_API_KEY` with your TMDB API key and replace `YOUR_ACCOUNT_ID` with your TMDB Account ID :
```xml
apiKey = 'YOUR_API_KEY';
accountId = 'YOUR_ACCOUNT_ID';

```

8. Save the file.
9. Run the app on an emulator or physical device by clicking the "Run" button in Android Studio.

## API Usage

The TMDA Android app utilizes the TMDB API to fetch movie and tv shows data. To use the app with the TMDB API, make sure to obtain an API key as mentioned in the prerequisites.

The API key is stored in the `api_constants.dart` file as described in the "Getting Started" section. This key is used by the app to authenticate requests to the TMDB API. Please make sure to keep your API key confidential and avoid exposing it publicly.

## Contributing

Contributions to the TMDA Flutter app are welcome! If you find any issues or want to add new features, please submit an issue or pull request on the GitHub repository.

When contributing, please adhere to the following guidelines:

- Fork the repository and create a new branch for your feature or bug fix.
- Ensure that your code follows the project's code style and conventions.
- Write clear and concise commit messages and provide a detailed description of your changes.
- Test your changes thoroughly before submitting a pull request.

## License

This project is licensed under the ![MIT License](https://img.shields.io/github/license/Bit-Camp-IO/TMDA-Flutter). Feel free to use, modify, and distribute the code as per the terms of the license.

## Acknowledgments

The TMDA Flutter app is built using the TMDB API, which power the whole app's features

. We would like to express our gratitude to the TMDB team for their efforts in providing this valuable resource.

## Contact

If you have any questions, suggestions, or feedback, please contact the project maintainer:

Email: momenmuhammad01@gmail.com\
GitHub: [Bit-Camp-IO](https://github.com/Bit-Camp-IO)
