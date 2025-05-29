// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TMDA`
  String get appName {
    return Intl.message('TMDA', name: 'appName', desc: '', args: []);
  }

  /// `We couldn't find this route`
  String get noRouteFound {
    return Intl.message(
      'We couldn\'t find this route',
      name: 'noRouteFound',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get movie {
    return Intl.message('Movies', name: 'movie', desc: '', args: []);
  }

  /// `TV Shows`
  String get tv {
    return Intl.message('TV Shows', name: 'tv', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `User name`
  String get loginUserName {
    return Intl.message('User name', name: 'loginUserName', desc: '', args: []);
  }

  /// `Password`
  String get loginPassword {
    return Intl.message('Password', name: 'loginPassword', desc: '', args: []);
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your guide to movies, TV shows\n and celebrities`
  String get appOverview {
    return Intl.message(
      'Your guide to movies, TV shows\n and celebrities',
      name: 'appOverview',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our\n community`
  String get loginWelcome {
    return Intl.message(
      'Welcome to our\n community',
      name: 'loginWelcome',
      desc: '',
      args: [],
    );
  }

  /// `New movies`
  String get newMoviesSectionTitle {
    return Intl.message(
      'New movies',
      name: 'newMoviesSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Popular movies`
  String get popularMoviesSectionTitle {
    return Intl.message(
      'Popular movies',
      name: 'popularMoviesSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated movies`
  String get topRatedMoviesSectionTitle {
    return Intl.message(
      'Top Rated movies',
      name: 'topRatedMoviesSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAllMoviesButtonTitle {
    return Intl.message(
      'See All',
      name: 'seeAllMoviesButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `User Reviews`
  String get movieDetailsUserReviews {
    return Intl.message(
      'User Reviews',
      name: 'movieDetailsUserReviews',
      desc: '',
      args: [],
    );
  }

  /// `Review By`
  String get movieDetailsReviewTitle {
    return Intl.message(
      'Review By',
      name: 'movieDetailsReviewTitle',
      desc: '',
      args: [],
    );
  }

  /// `No rating`
  String get movieDetailsNoRating {
    return Intl.message(
      'No rating',
      name: 'movieDetailsNoRating',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find any videos for this movie`
  String get movieNoVideosMessage {
    return Intl.message(
      'Couldn\'t find any videos for this movie',
      name: 'movieNoVideosMessage',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find movie cast.`
  String get noMovieCast {
    return Intl.message(
      'Couldn\'t find movie cast.',
      name: 'noMovieCast',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find similar movies.`
  String get noSimilarMovies {
    return Intl.message(
      'Couldn\'t find similar movies.',
      name: 'noSimilarMovies',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find recommended movies.`
  String get noRecommendedMovies {
    return Intl.message(
      'Couldn\'t find recommended movies.',
      name: 'noRecommendedMovies',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find any videos for this TvShow.`
  String get tvShowNoVideosMessage {
    return Intl.message(
      'Couldn\'t find any videos for this TvShow.',
      name: 'tvShowNoVideosMessage',
      desc: '',
      args: [],
    );
  }

  /// `Popular Shows`
  String get popularTvShowSectionTitle {
    return Intl.message(
      'Popular Shows',
      name: 'popularTvShowSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated`
  String get topRatedTvShowSectionTitle {
    return Intl.message(
      'Top Rated',
      name: 'topRatedTvShowSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Airing Today`
  String get airingTodaySectionTitle {
    return Intl.message(
      'Airing Today',
      name: 'airingTodaySectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't find Recommended Tv Shows.`
  String get noRecommendedTvShows {
    return Intl.message(
      'We couldn\'t find Recommended Tv Shows.',
      name: 'noRecommendedTvShows',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't similar TvShows.`
  String get noSimilarTvShows {
    return Intl.message(
      'We couldn\'t similar TvShows.',
      name: 'noSimilarTvShows',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get tvDetailsOverviewTab {
    return Intl.message(
      'Overview',
      name: 'tvDetailsOverviewTab',
      desc: '',
      args: [],
    );
  }

  /// `Seasons`
  String get tvDetailsSeasonsTab {
    return Intl.message(
      'Seasons',
      name: 'tvDetailsSeasonsTab',
      desc: '',
      args: [],
    );
  }

  /// `No Episodes yet`
  String get noEpisodes {
    return Intl.message(
      'No Episodes yet',
      name: 'noEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find tv show cast.`
  String get noTvShowCast {
    return Intl.message(
      'Couldn\'t find tv show cast.',
      name: 'noTvShowCast',
      desc: '',
      args: [],
    );
  }

  /// `Movies Watchlist`
  String get moviesWatchlistTitle {
    return Intl.message(
      'Movies Watchlist',
      name: 'moviesWatchlistTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Movies `
  String get emptyMoviesWatchListButtonTitle {
    return Intl.message(
      'Add Movies ',
      name: 'emptyMoviesWatchListButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `TvShows Watchlist`
  String get tvShowsWatchlistTitle {
    return Intl.message(
      'TvShows Watchlist',
      name: 'tvShowsWatchlistTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add TvShows `
  String get emptyTvShowsWatchListButtonTitle {
    return Intl.message(
      'Add TvShows ',
      name: 'emptyTvShowsWatchListButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `No Account Name`
  String get noAccountName {
    return Intl.message(
      'No Account Name',
      name: 'noAccountName',
      desc: '',
      args: [],
    );
  }

  /// `Biography`
  String get biography {
    return Intl.message('Biography', name: 'biography', desc: '', args: []);
  }

  /// `Couldn't Find biography.`
  String get emptyBiography {
    return Intl.message(
      'Couldn\'t Find biography.',
      name: 'emptyBiography',
      desc: '',
      args: [],
    );
  }

  /// `Read Less`
  String get readLess {
    return Intl.message('Read Less', name: 'readLess', desc: '', args: []);
  }

  /// `Read More`
  String get readMore {
    return Intl.message('Read More', name: 'readMore', desc: '', args: []);
  }

  /// `We couldn't find any movies.`
  String get noPersonMovies {
    return Intl.message(
      'We couldn\'t find any movies.',
      name: 'noPersonMovies',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't find TvShows.`
  String get noPersonTvShows {
    return Intl.message(
      'We couldn\'t find TvShows.',
      name: 'noPersonTvShows',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get searchMoviesTab {
    return Intl.message('Movies', name: 'searchMoviesTab', desc: '', args: []);
  }

  /// `Tv Shows`
  String get searchTvShowsTab {
    return Intl.message(
      'Tv Shows',
      name: 'searchTvShowsTab',
      desc: '',
      args: [],
    );
  }

  /// `People`
  String get searchPeopleTab {
    return Intl.message('People', name: 'searchPeopleTab', desc: '', args: []);
  }

  /// `Couldn't find any results.`
  String get noSearchResults {
    return Intl.message(
      'Couldn\'t find any results.',
      name: 'noSearchResults',
      desc: '',
      args: [],
    );
  }

  /// `Search for what you want.`
  String get initialSearchTitle {
    return Intl.message(
      'Search for what you want.',
      name: 'initialSearchTitle',
      desc: '',
      args: [],
    );
  }

  /// `Movies, TvShows, Persons.`
  String get initialSearchSubTitle {
    return Intl.message(
      'Movies, TvShows, Persons.',
      name: 'initialSearchSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAllButtonTitle {
    return Intl.message(
      'See All',
      name: 'seeAllButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Similar`
  String get detailsSimilarSectionTitle {
    return Intl.message(
      'Similar',
      name: 'detailsSimilarSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get detailsRecommendedSectionTitle {
    return Intl.message(
      'Recommended',
      name: 'detailsRecommendedSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `/10`
  String get maxRate {
    return Intl.message('/10', name: 'maxRate', desc: '', args: []);
  }

  /// `Votes`
  String get votes {
    return Intl.message('Votes', name: 'votes', desc: '', args: []);
  }

  /// `Add`
  String get addToWatchlist {
    return Intl.message('Add', name: 'addToWatchlist', desc: '', args: []);
  }

  /// `Remove`
  String get removeFromWatchList {
    return Intl.message(
      'Remove',
      name: 'removeFromWatchList',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get productionYear {
    return Intl.message('Year', name: 'productionYear', desc: '', args: []);
  }

  /// `Aired`
  String get airedTitle {
    return Intl.message('Aired', name: 'airedTitle', desc: '', args: []);
  }

  /// `Country`
  String get productionCountry {
    return Intl.message(
      'Country',
      name: 'productionCountry',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get length {
    return Intl.message('Length', name: 'length', desc: '', args: []);
  }

  /// `Cast`
  String get castSectionTitle {
    return Intl.message('Cast', name: 'castSectionTitle', desc: '', args: []);
  }

  /// `Min`
  String get duration {
    return Intl.message('Min', name: 'duration', desc: '', args: []);
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `From`
  String get from {
    return Intl.message('From', name: 'from', desc: '', args: []);
  }

  /// `Couldn't find any reviews.`
  String get noReviews {
    return Intl.message(
      'Couldn\'t find any reviews.',
      name: 'noReviews',
      desc: '',
      args: [],
    );
  }

  /// `There was an error`
  String get error {
    return Intl.message(
      'There was an error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Please check your connection`
  String get checkYourConnection {
    return Intl.message(
      'Please check your connection',
      name: 'checkYourConnection',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `From {voteCount} users`
  String voteCount(Object voteCount) {
    return Intl.message(
      'From $voteCount users',
      name: 'voteCount',
      desc: '',
      args: [voteCount],
    );
  }

  /// `TMDB {rating}`
  String tmdbRating(Object rating) {
    return Intl.message(
      'TMDB $rating',
      name: 'tmdbRating',
      desc: '',
      args: [rating],
    );
  }

  /// `Known For : {knownFor}`
  String knownFor(Object knownFor) {
    return Intl.message(
      'Known For : $knownFor',
      name: 'knownFor',
      desc: '',
      args: [knownFor],
    );
  }

  /// `{numberOfSeasons} Seasons`
  String tvShowSeasons(Object numberOfSeasons) {
    return Intl.message(
      '$numberOfSeasons Seasons',
      name: 'tvShowSeasons',
      desc: '',
      args: [numberOfSeasons],
    );
  }

  /// `{numberOfEpisodes} Episodes`
  String tvShowEpisodes(Object numberOfEpisodes) {
    return Intl.message(
      '$numberOfEpisodes Episodes',
      name: 'tvShowEpisodes',
      desc: '',
      args: [numberOfEpisodes],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
