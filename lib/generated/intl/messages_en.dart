// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(knownFor) => "Known For : ${knownFor}";

  static String m1(rating) => "TMDB ${rating}";

  static String m2(numberOfEpisodes) => "${numberOfEpisodes} Episodes";

  static String m3(numberOfSeasons) => "${numberOfSeasons} Seasons";

  static String m4(voteCount) => "From ${voteCount} users";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "addToWatchlist": MessageLookupByLibrary.simpleMessage("Add"),
    "airedTitle": MessageLookupByLibrary.simpleMessage("Aired"),
    "airingTodaySectionTitle": MessageLookupByLibrary.simpleMessage(
      "Airing Today",
    ),
    "appName": MessageLookupByLibrary.simpleMessage("TMDA"),
    "appOverview": MessageLookupByLibrary.simpleMessage(
      "Your guide to movies, TV shows\n and celebrities",
    ),
    "biography": MessageLookupByLibrary.simpleMessage("Biography"),
    "castSectionTitle": MessageLookupByLibrary.simpleMessage("Cast"),
    "checkYourConnection": MessageLookupByLibrary.simpleMessage(
      "Please check your connection",
    ),
    "detailsRecommendedSectionTitle": MessageLookupByLibrary.simpleMessage(
      "Recommended",
    ),
    "detailsSimilarSectionTitle": MessageLookupByLibrary.simpleMessage(
      "Similar",
    ),
    "duration": MessageLookupByLibrary.simpleMessage("Min"),
    "emptyBiography": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t Find biography.",
    ),
    "emptyMoviesWatchListButtonTitle": MessageLookupByLibrary.simpleMessage(
      "Add Movies ",
    ),
    "emptyTvShowsWatchListButtonTitle": MessageLookupByLibrary.simpleMessage(
      "Add TvShows ",
    ),
    "error": MessageLookupByLibrary.simpleMessage("There was an error"),
    "forgetPassword": MessageLookupByLibrary.simpleMessage("Forget Password?"),
    "from": MessageLookupByLibrary.simpleMessage("From"),
    "initialSearchSubTitle": MessageLookupByLibrary.simpleMessage(
      "Movies, TvShows, Persons.",
    ),
    "initialSearchTitle": MessageLookupByLibrary.simpleMessage(
      "Search for what you want.",
    ),
    "knownFor": m0,
    "length": MessageLookupByLibrary.simpleMessage("Length"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginPassword": MessageLookupByLibrary.simpleMessage("Password"),
    "loginUserName": MessageLookupByLibrary.simpleMessage("User name"),
    "loginWelcome": MessageLookupByLibrary.simpleMessage(
      "Welcome to our\n community",
    ),
    "maxRate": MessageLookupByLibrary.simpleMessage("/10"),
    "movie": MessageLookupByLibrary.simpleMessage("Movies"),
    "movieDetailsNoRating": MessageLookupByLibrary.simpleMessage("No rating"),
    "movieDetailsReviewTitle": MessageLookupByLibrary.simpleMessage(
      "Review By",
    ),
    "movieDetailsUserReviews": MessageLookupByLibrary.simpleMessage(
      "User Reviews",
    ),
    "movieNoVideosMessage": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find any videos for this movie",
    ),
    "moviesWatchlistTitle": MessageLookupByLibrary.simpleMessage(
      "Movies Watchlist",
    ),
    "newMoviesSectionTitle": MessageLookupByLibrary.simpleMessage("New movies"),
    "noAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account ?",
    ),
    "noAccountName": MessageLookupByLibrary.simpleMessage("No Account Name"),
    "noEpisodes": MessageLookupByLibrary.simpleMessage("No Episodes yet"),
    "noMovieCast": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find movie cast.",
    ),
    "noPersonMovies": MessageLookupByLibrary.simpleMessage(
      "We couldn\'t find any movies.",
    ),
    "noPersonTvShows": MessageLookupByLibrary.simpleMessage(
      "We couldn\'t find TvShows.",
    ),
    "noRecommendedMovies": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find recommended movies.",
    ),
    "noRecommendedTvShows": MessageLookupByLibrary.simpleMessage(
      "We couldn\'t find Recommended Tv Shows.",
    ),
    "noReviews": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find any reviews.",
    ),
    "noRouteFound": MessageLookupByLibrary.simpleMessage(
      "We couldn\'t find this route",
    ),
    "noSearchResults": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find any results.",
    ),
    "noSimilarMovies": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find similar movies.",
    ),
    "noSimilarTvShows": MessageLookupByLibrary.simpleMessage(
      "We couldn\'t similar TvShows.",
    ),
    "noTvShowCast": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find tv show cast.",
    ),
    "popularMoviesSectionTitle": MessageLookupByLibrary.simpleMessage(
      "Popular movies",
    ),
    "popularTvShowSectionTitle": MessageLookupByLibrary.simpleMessage(
      "Popular Shows",
    ),
    "productionCountry": MessageLookupByLibrary.simpleMessage("Country"),
    "productionYear": MessageLookupByLibrary.simpleMessage("Year"),
    "readLess": MessageLookupByLibrary.simpleMessage("Read Less"),
    "readMore": MessageLookupByLibrary.simpleMessage("Read More"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registerNow": MessageLookupByLibrary.simpleMessage("Register Now"),
    "removeFromWatchList": MessageLookupByLibrary.simpleMessage("Remove"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchMoviesTab": MessageLookupByLibrary.simpleMessage("Movies"),
    "searchPeopleTab": MessageLookupByLibrary.simpleMessage("People"),
    "searchTvShowsTab": MessageLookupByLibrary.simpleMessage("Tv Shows"),
    "seeAllButtonTitle": MessageLookupByLibrary.simpleMessage("See All"),
    "seeAllMoviesButtonTitle": MessageLookupByLibrary.simpleMessage("See All"),
    "tmdbRating": m1,
    "topRatedMoviesSectionTitle": MessageLookupByLibrary.simpleMessage(
      "Top Rated movies",
    ),
    "topRatedTvShowSectionTitle": MessageLookupByLibrary.simpleMessage(
      "Top Rated",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
    "tv": MessageLookupByLibrary.simpleMessage("TV Shows"),
    "tvDetailsOverviewTab": MessageLookupByLibrary.simpleMessage("Overview"),
    "tvDetailsSeasonsTab": MessageLookupByLibrary.simpleMessage("Seasons"),
    "tvShowEpisodes": m2,
    "tvShowNoVideosMessage": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t find any videos for this TvShow.",
    ),
    "tvShowSeasons": m3,
    "tvShowsWatchlistTitle": MessageLookupByLibrary.simpleMessage(
      "TvShows Watchlist",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "voteCount": m4,
    "votes": MessageLookupByLibrary.simpleMessage("Votes"),
  };
}
