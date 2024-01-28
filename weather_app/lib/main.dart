import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Core/DI/injection.dart';
import 'package:weather_app/Core/Provider/home_provider.dart';
import 'package:weather_app/Core/Provider/onboarding_provider.dart';
import 'package:weather_app/Core/Provider/splash_provider.dart';
import 'package:weather_app/Feature/Presentation/Screens/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependenciesInjection().setUp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnboardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.aBeeZeeTextTheme()),
      title: 'Weather App',
      home: const SplashPage(),
    );
  }
}
