import 'package:flutter/material.dart';
import 'themes/app_theme.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/imc_screen.dart';
import 'screens/calories_burned_screen.dart';
import 'screens/calories_intake_screen.dart';
import 'screens/insights_screen.dart';

void main() {
  runApp(const NutriAIApp());
}

class NutriAIApp extends StatelessWidget {
  const NutriAIApp({super.key});

  Route _fadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 350),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriAI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _fadeRoute(const SplashScreen());
          case '/onboarding':
            return _fadeRoute(const OnboardingScreen());
          case '/dashboard':
            return _fadeRoute(const DashboardScreen());
          case '/imc':
            return _fadeRoute(const ImcScreen());
          case '/calorias_gastas':
            return _fadeRoute(const CaloriesBurnedScreen());
          case '/calorias_ingeridas':
            return _fadeRoute(const CaloriesIntakeScreen());
          case '/insights':
            return _fadeRoute(const InsightsScreen());
          default:
            return null;
        }
      },
    );
  }
}

// Exemplo de navegação a partir do DashboardScreen:
// Navigator.pushNamed(context, '/imc');
// Navigator.pushNamed(context, '/calorias_gastas');
// Navigator.pushNamed(context, '/calorias_ingeridas');
// Navigator.pushNamed(context, '/insights'); 