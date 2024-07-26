import 'package:booklykian/core/utils/api_service.dart';
import 'package:booklykian/features/home/data/repo/home_repo_imple.dart';
import 'package:booklykian/features/home/presentation/view_models/book_view_model.dart';
import 'package:booklykian/features/home/presentation/views/book_details_view.dart';
import 'package:booklykian/features/home/presentation/views/home_view.dart';
import 'package:booklykian/features/splash/presentation/views/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BookViewModel(
            homeRepo: HomeRepoImple(apiService: ApiService(dio: Dio())),
          ),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData.dark().textTheme,
        ),
        scaffoldBackgroundColor: const Color(
          0xff100B20,
        ),
      ),
      routes: {
        '/home': (context) => const HomeView(),
        '/book_details': (context) => const BookDetailsView(),
        '/': (context) => const SplashScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}
