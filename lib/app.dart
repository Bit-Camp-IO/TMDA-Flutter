import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/config/theme/theme_manager.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/movie/presentation/bloc/dot_indicator/dot_indicator_cubit.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_cubit.dart';
import 'package:tmda/features/movie/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:tmda/injection_container.dart';
import 'package:tmda/route_observer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthCubit>()..checkUserLoggedIn(),
        ),
        BlocProvider(
          create: (context) => sl<MoviesBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetNewMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
        BlocProvider(
          create: (context) => sl<DotIndicatorCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<MovieDetailsCubit>(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: sl<AppRouter>().config(
            navigatorObservers: () => [MyRouteObserver()],
          ),
          theme: ThemeManager.darkTheme(),
        ),
      ),
    );
  }
}
