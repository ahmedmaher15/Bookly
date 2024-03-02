import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_news_books_use_case.dart';
import 'package:bookly/features/home/presentation/manger/featured_books/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/functions/setup_service_locator.dart';
import 'features/home/presentation/manger/newest_books/newest_books_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer=SimpleBlocObserver();
  runApp(const BooklyApp());
}



class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBookUseCase(
                homeRepo: getIt.get<HomeRepoImpl>(),
              ),
            );
          }),
          BlocProvider(create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(
                homeRepo: getIt.get<HomeRepoImpl>(),
              ),
            );
          }),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme:
                  GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
          debugShowCheckedModeBanner: false,
          // home: const SplashView(),
        ));
  }
}

// GoRouter configuration
